import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gabriel_api/model/cliente.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class NovoCliente extends StatefulWidget {
  const NovoCliente({Key? key}) : super(key: key);

  @override
  State<NovoCliente> createState() => _NovoClienteState();
}

class _NovoClienteState extends State<NovoCliente> {
  final _nomeEmpresarialEC = TextEditingController();
  final _cnpjEC = TextEditingController();
  final _nomeFantasiaEC = TextEditingController();
  final _cidadeEC = TextEditingController();
  final _ufEC = TextEditingController();
  final _telefoneContatoEC = TextEditingController();
  final _nomeRepresentanteEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        title: const Text('Novo Cliente'),
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: _nomeEmpresarialEC,
                      decoration: InputDecoration(
                        hintText: 'Nome empresarial',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: Validatorless.required('Campo obrigatório'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _cnpjEC,
                      inputFormatters: [maskFormatterCNPJ],
                      keyboardType: TextInputType.number,
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
                    ),
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  final formValid = _formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    String cnpj;
                    cnpj = _cnpjEC.text.replaceAll('.', '');
                    cnpj = cnpj.replaceAll('/', '');
                    cnpj = cnpj.replaceAll('-', '');

                    var documentos = await FirebaseFirestore.instance.collection('clientes').get();
                    for (var element in documentos.docs) {
                      if (element.id == cnpj) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('CNPJ já está cadastrado, favor inserir outro CNPJ'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                    }
                    var cliente = Cliente(
                      nomeEmpresarial: _nomeEmpresarialEC.text,
                      cnpj: _cnpjEC.text,
                      cidade: _cidadeEC.text,
                      uf: _ufEC.text,
                      nomeFantasia: _nomeFantasiaEC.text.isEmpty ? null : _nomeFantasiaEC.text,
                      nomeRepresentante:
                          _nomeRepresentanteEC.text.isEmpty ? null : _nomeEmpresarialEC.text,
                      telefoneContato:
                          _telefoneContatoEC.text.isEmpty ? null : _telefoneContatoEC.text,
                    );
                    await FirebaseFirestore.instance
                        .collection('clientes')
                        .doc(cnpj)
                        .set(cliente.toMap());
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cadastro efetuado com sucesso'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
