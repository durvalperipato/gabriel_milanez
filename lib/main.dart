import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gabriel_api/model/cliente.dart';
import 'package:gabriel_api/view/cliente/widgets/cliente_page.dart';

import 'firebase_options.dart';
import 'view/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Clientes',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/': (context) => const HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/cliente/') {
          final cliente = settings.arguments as Cliente?;
          return MaterialPageRoute(
            builder: (_) => ClientePage(
              cliente: cliente,
            ),
          );
        }
        return null;
      },
    );
  }
}
