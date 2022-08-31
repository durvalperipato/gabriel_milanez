// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../cliente_home_page.dart';

class _ListaClientes extends StatelessWidget {
  final List<Cliente> clientes;
  final VoidCallback? whenUpdate;

  const _ListaClientes({
    Key? key,
    required this.clientes,
    this.whenUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 142,
                              child: Text(
                                'Nome Fantasia:',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Text(
                              cliente.nomeFantasia,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(
                              width: 142,
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
                              width: 142,
                              child: Text(
                                'Cidade:',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(cliente.cidade),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        await Navigator.of(context).pushNamed('/cliente/', arguments: cliente);
                        if (whenUpdate != null) {
                          whenUpdate!();
                        }
                      },
                      icon: const Icon(Icons.more_vert),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
