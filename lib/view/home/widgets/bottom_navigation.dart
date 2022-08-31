// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../home_page.dart';

typedef ItemSelected = Function(Widget);

class _BottomNavigation extends StatefulWidget {
  final ItemSelected onTap;
  const _BottomNavigation({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<_BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<_BottomNavigation> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(45, 141, 163, 1),
      enableFeedback: true,
      type: BottomNavigationBarType.fixed,
      iconSize: 35,
      currentIndex: _index,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      elevation: 5,
      onTap: (value) {
        _itemSelected(value);
        setState(() {
          _index = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Clientes',
          icon: Icon(Icons.groups),
        ),
        BottomNavigationBarItem(
          label: 'Novo Pedido',
          icon: Icon(Icons.add_box),
        ),
        BottomNavigationBarItem(
          label: 'Pedidos',
          icon: Icon(Icons.list_alt),
        ),
        BottomNavigationBarItem(
          label: 'Usuário',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }

  void _itemSelected(int value) {
    switch (value) {
      case 0:
        widget.onTap(const ClienteHomePage());
        break;
      case 1:
        widget.onTap(const NovoPedido());
        break;
      case 2:
        widget.onTap(const ListaPedidos());
        break;
      case 3:
        widget.onTap(const Usuario());
        break;
    }
  }
}
