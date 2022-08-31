// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gabriel_api/controller/cliente_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

import '../../../model/cliente.dart';

class ClientePage extends StatefulWidget {
  final Cliente? cliente;

  const ClientePage({
    Key? key,
    this.cliente,
  }) : super(key: key);

  @override
  State<ClientePage> createState() => _NovoClienteState();
}

class _NovoClienteState extends State<ClientePage> {
  final ClienteController controller = ClienteController();
  final _nomeEmpresarialEC = TextEditingController(text: 'Boticario');
  final _cnpjEC = TextEditingController(text: '76.801.166/0001-79');
  final _nomeFantasiaEC = TextEditingController(text: 'Boticario');
  final _cidadeEC = TextEditingController(text: 'Porto Ferreira');
  final _ufEC = TextEditingController(text: 'SP');
  final _telefoneContatoEC = TextEditingController();
  final _nomeRepresentanteEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool editarCliente = false;

  @override
  void initState() {
    if (widget.cliente != null) {
      editarCliente = true;
      final cliente = widget.cliente;
      _nomeEmpresarialEC.text = cliente!.nomeEmpresarial;
      _cnpjEC.text = cliente.cnpj;
      _nomeFantasiaEC.text = cliente.nomeFantasia;
      _cidadeEC.text = cliente.cidade;
      _ufEC.text = cliente.uf;
      _telefoneContatoEC.text = cliente.telefoneContato ?? '';
      _nomeRepresentanteEC.text = cliente.nomeRepresentante ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    _nomeEmpresarialEC.dispose();
    _cnpjEC.dispose();
    _nomeFantasiaEC.dispose();
    _cidadeEC.dispose();
    _ufEC.dispose();
    _telefoneContatoEC.dispose();
    _nomeRepresentanteEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var maskFormatterCNPJ = MaskTextInputFormatter(
        mask: '##.###.###/####-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    var maskFormatterCelular = MaskTextInputFormatter(
        mask: '(##) #-####-####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(43, 121, 163, 1),
        title: Text(editarCliente ? 'Editar Cliente' : 'Novo Cliente'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ]),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: _nomeEmpresarialEC,
                      enabled: editarCliente ? false : true,
                      style: editarCliente
                          ? const TextStyle(color: Colors.grey)
                          : const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Nome empresarial',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: Validatorless.required('Campo obrigatório'),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          widget.cliente?.nomeEmpresarial = newValue;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _cnpjEC,
                      inputFormatters: [maskFormatterCNPJ],
                      keyboardType: TextInputType.number,
                      enabled: editarCliente ? false : true,
                      style: editarCliente
                          ? const TextStyle(color: Colors.grey)
                          : const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'CNPJ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.cnpj('CNPJ Inválido'),
                      ]),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          widget.cliente?.cnpj = newValue;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: _nomeFantasiaEC,
                        decoration: InputDecoration(
                          hintText: 'Nome Fantasia',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: Validatorless.required('Campo obrigatório'),
                        onSaved: (newValue) {
                          if (newValue != null) {
                            widget.cliente?.nomeFantasia = newValue;
                          }
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _cidadeEC,
                      decoration: InputDecoration(
                        hintText: 'Cidade',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: Validatorless.required('Campo obrigatório'),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          widget.cliente?.cidade = newValue;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _ufEC,
                      decoration: InputDecoration(
                        hintText: 'UF',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: Validatorless.required('Campo obrigatório'),
                      onSaved: (newValue) {
                        if (newValue != null) {
                          widget.cliente?.uf = newValue;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _telefoneContatoEC,
                      inputFormatters: [
                        maskFormatterCelular,
                      ],
                      decoration: InputDecoration(
                        hintText: 'Telefone de Contato',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSaved: (newValue) => widget.cliente?.telefoneContato = newValue,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _nomeRepresentanteEC,
                      decoration: InputDecoration(
                        hintText: 'Nome do Representante',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSaved: (newValue) => widget.cliente?.nomeRepresentante = newValue,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.maxFinite, 45)),
                onPressed: () async {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    if (editarCliente) {
                      _formKey.currentState?.save();
                      controller.editarCliente(
                        context: context,
                        cliente: widget.cliente!,
                      );
                    } else {
                      controller.cadastrarCliente(
                        context: context,
                        nomeEmpresarial: _nomeEmpresarialEC.text,
                        cnpj: _cnpjEC.text,
                        cidade: _cidadeEC.text,
                        uf: _ufEC.text,
                        nomeFantasia: _nomeFantasiaEC.text,
                        nomeRepresentante: _nomeEmpresarialEC.text,
                        telefoneContato: _telefoneContatoEC.text,
                      );
                    }
                  }
                },
                child: Text(
                  editarCliente ? 'Editar' : 'Cadastrar',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            editarCliente
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Tem certeza que deseja excluir o cliente?',
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await controller.deletarCliente(
                                            context: context, cliente: widget.cliente!);
                                        // ignore: use_build_context_synchronously
                                        Navigator.popUntil(context, (route) => route.isFirst);
                                      },
                                      child: const Text('Confirmar'),
                                    ),
                                  ],
                                ));
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.maxFinite, 45),
                        primary: Colors.red[300],
                      ),
                      child: const Text(
                        'Deletar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
