import 'package:flutter/material.dart';
import 'package:gabriel_api/view/home/widgets/lista_clientes.dart';

import 'widgets/novo_pedido.dart';
import 'widgets/pedidos.dart';
import 'widgets/usuario.dart';

part 'widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget child = const ListaClientes();
  String title = 'Clientes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: child,
      bottomNavigationBar: _BottomNavigation(
        onTap: (value) {
          setState(() {
            child = value;
          });
        },
      ),
    );
  }
}
