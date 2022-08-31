// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../cliente_home_page.dart';

class _AppBarCliente extends StatelessWidget {
  final Debouncer _debouncer = Debouncer();
  final ClienteController controller;

  _AppBarCliente({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
            onChanged: (value) {
              _debouncer.run(() {
                controller.filtarCliente(value);
              });
            },
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
    );
  }
}
