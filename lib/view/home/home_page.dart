import 'package:flutter/material.dart';
import 'package:gabriel_api/view/cliente/cliente_home_page.dart';

import '../pedido/lista_pedidos.dart';
import '../pedido/novo_pedido.dart';
import '../usuario/usuario.dart';

part 'widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget child = const ClienteHomePage();
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
