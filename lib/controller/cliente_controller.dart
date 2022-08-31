// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:gabriel_api/core/local_storage.dart';
import 'package:gabriel_api/core/messages.dart';

import '../model/cliente.dart';

class ClienteController extends ChangeNotifier {
  String formatCnpj = '';
  List<Cliente> clientes = [];
  List<Cliente> clientesCache = [];
  bool isLoading = true;

  Future<void> cadastrarCliente({
    required BuildContext context,
    required String nomeEmpresarial,
    required cnpj,
    required String cidade,
    required String uf,
    required String nomeFantasia,
    String? nomeRepresentante,
    String? telefoneContato,
  }) async {
    try {
      _formatarCNPJ(cnpj);
      var documentos = await FirebaseFirestore.instance.collection('clientes').get();
      for (var element in documentos.docs) {
        if (element.id == formatCnpj) {
          Messages.error(context, 'CNPJ já cadastrado, favor inserir outro CNPJ');
          return;
        }
      }
      var cliente = Cliente(
        nomeEmpresarial: nomeEmpresarial,
        cnpj: cnpj,
        cidade: cidade,
        uf: uf,
        nomeFantasia: nomeFantasia,
        nomeRepresentante:
            nomeRepresentante != null && nomeRepresentante.isEmpty ? null : nomeEmpresarial,
        telefoneContato:
            telefoneContato != null && telefoneContato.isEmpty ? null : telefoneContato,
      );
      await FirebaseFirestore.instance.collection('clientes').doc(formatCnpj).set(cliente.toMap());
      await buscarClientes();
      clientes.add(cliente);
      LocalStorage.save(clientes.map((cliente) => cliente.toJson()).toList());

      Messages.alert(context, 'Cadastro efetuado com sucesso');
    } on Exception {
      Messages.error(
          context, 'Erro ao realizar o cadastro, favor entrar em contato com o administrador');
    } finally {
      notifyListeners();
    }
  }

  Future<void> editarCliente({
    required BuildContext context,
    required Cliente cliente,
  }) async {
    try {
      _formatarCNPJ(cliente.cnpj);

      await FirebaseFirestore.instance
          .collection('clientes')
          .doc(formatCnpj)
          .update(cliente.toMap());
      await buscarClientes();
      var index = clientes.indexWhere((element) => element.cnpj == cliente.cnpj);
      clientes[index] = cliente;
      LocalStorage.save(clientes.map((cliente) => cliente.toJson()).toList());
      Messages.alert(context, 'Dados do cliente alterado com sucesso');
    } on Exception {
      Messages.error(context, 'Erro ao atualizar dados do cliente');
    } finally {
      notifyListeners();
    }
  }

  Future<void> deletarCliente({
    required BuildContext context,
    required Cliente cliente,
  }) async {
    try {
      _formatarCNPJ(cliente.cnpj);
      FirebaseFirestore.instance.collection('clientes').doc(formatCnpj).delete();
      clientes.remove(cliente);
      LocalStorage.save(clientes.map((cliente) => cliente.toJson()).toList());
      Messages.alert(context, 'Cliente ${cliente.nomeEmpresarial} deletado com sucesso');
    } on Exception {
      Messages.error(context, 'Erro ao deletar cliente');
    } finally {
      notifyListeners();
    }
  }

  Future<void> buscarClientes() async {
    try {
      var listaLocalClientes = await LocalStorage.buscarListaClientes();
      clientes = [...listaLocalClientes.map((cliente) => Cliente.fromJson(cliente)).toList()];
      clientesCache = [...clientes];

      if (clientes.isEmpty) {
        var documentos = await FirebaseFirestore.instance.collection('clientes').get();
        for (var element in documentos.docs) {
          var cliente = element.data();
          clientes.add(Cliente.fromMap(cliente));
          clientesCache = [...clientes];
        }
        LocalStorage.save(clientes.map((cliente) => cliente.toJson()).toList());
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filtarCliente(String name) {
    name = name.toLowerCase();
    clientes = clientesCache
        .where(
          (element) =>
              element.cnpj.toLowerCase().contains(name) ||
              element.cidade.toLowerCase().contains(name) ||
              element.nomeFantasia.toLowerCase().contains(name),
        )
        .toList();
    notifyListeners();
  }

  void _formatarCNPJ(String cnpj) {
    formatCnpj = cnpj.replaceAll('.', '');
    formatCnpj = formatCnpj.replaceAll('/', '');
    formatCnpj = formatCnpj.replaceAll('-', '');
  }
}
