import 'package:flutter/material.dart';

class Usuario extends StatelessWidget {
  const Usuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.teal,
                height: 160,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Align(
                  alignment: Alignment(0, -1),
                  child: CircleAvatar(
                    radius: 80,
                    foregroundImage: AssetImage('assets/images/perfil.jpg'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 70,
                              child: Text(
                                'Nome:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Gabriel Milanez',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 70,
                              child: Text(
                                'Cargo:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Analista de Dados',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 70,
                              child: Text(
                                'Área:',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Inteligência de Mercado',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
