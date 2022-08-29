// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gabriel_api/model/cliente.dart';
import 'package:gabriel_api/view/home/widgets/novo_cliente.dart';

class ListaClientes extends StatelessWidget {
  const ListaClientes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection('clientes').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Cliente> clientes = [];
              if (snapshot.data != null) {
                var documentos = snapshot.data as QuerySnapshot;
                for (var element in documentos.docs) {
                  if (element.data() is Map) {
                    var cliente = element.data() as Map<String, dynamic>;
                    clientes.add(Cliente.fromMap(cliente));
                  }
                }
              }

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: const Color.fromRGBO(43, 141, 163, 1),
                    toolbarHeight: 80,
                    elevation: 10,
                    title: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            hintText: 'Filtrar Clientes',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  clientes.isEmpty
                      ? SliverFillRemaining(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.warning,
                                size: 120,
                                color: Colors.red[300],
                              ),
                              const SizedBox(height: 35),
                              const Text(
                                'Nenhum cliente cadastrado',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'Favor inserir um novo cliente, clicando no botão +',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: clientes.length,
                            (context, index) {
                              var cliente = clientes[index];
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(2, 2),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 180,
                                              child: Text(
                                                'Nome Empresarial:',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(cliente.nomeEmpresarial),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 180,
                                              child: Text(
                                                'CNPJ:',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(cliente.cnpj),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 180,
                                              child: Text(
                                                'Nome Fantasia:',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(cliente.nomeFantasia ?? 'Não informado'),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 180,
                                              child: Text(
                                                'Cidade:',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(cliente.cidade),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const SizedBox(width: 180, child: Text('UF:')),
                                            Text(cliente.uf),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const SizedBox(
                                                width: 180, child: Text('Telefone de Contato:')),
                                            Text(cliente.telefoneContato ?? 'Não informado'),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const SizedBox(
                                                width: 180, child: Text('Nome do Representante:')),
                                            Text(
                                              cliente.nomeRepresentante ?? 'Não informado',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NovoCliente(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
