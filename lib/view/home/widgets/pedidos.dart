import 'package:flutter/material.dart';

class Pedidos extends StatelessWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 15,
            pinned: true,
            toolbarHeight: 80,
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
                    hintText: 'Filtrar Pedidos',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 110,
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
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          decoration: BoxDecoration(
                            color: index.isOdd
                                ? Colors.green
                                : index == 4
                                    ? Colors.yellow
                                    : Colors.red,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Pedido ID:',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${index + 1}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      'Cliente:',
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'José Antônio',
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      'Data:',
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '10/08/2022',
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      'Status:',
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Aprovado',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                          iconSize: 30,
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
