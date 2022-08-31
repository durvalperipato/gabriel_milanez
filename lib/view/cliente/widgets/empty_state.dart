part of '../cliente_home_page.dart';

class _EmptyState extends StatelessWidget {
  const _EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
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
    );
  }
}
