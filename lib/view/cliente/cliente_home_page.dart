// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gabriel_api/controller/cliente_controller.dart';

import '../../core/debouncer.dart';
import '../../model/cliente.dart';

part 'widgets/app_bar_cliente.dart';
part 'widgets/empty_state.dart';
part 'widgets/lista_clientes.dart';

class ClienteHomePage extends StatefulWidget {
  const ClienteHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ClienteHomePage> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ClienteHomePage> {
  final ClienteController controller = ClienteController();

  @override
  void initState() {
    controller.buscarClientes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return CustomScrollView(
            slivers: [
              _AppBarCliente(
                controller: controller,
              ),
              controller.clientes.isEmpty
                  ? const _EmptyState()
                  : _ListaClientes(
                      clientes: controller.clientes,
                      whenUpdate: () async {
                        await controller.buscarClientes();
                      },
                    ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/cliente/');
          controller.buscarClientes();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
