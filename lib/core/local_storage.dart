import 'package:shared_preferences/shared_preferences.dart';

class _CLIENTES {
  _CLIENTES._();
  static const String clientes = 'CLIENTES';
}

class LocalStorage {
  LocalStorage._();

  static Future<void> save(List<String> clientes) async {
    var local = await SharedPreferences.getInstance();
    local.setStringList(_CLIENTES.clientes, clientes);
  }

  static Future<List<String>> buscarListaClientes() async {
    var local = await SharedPreferences.getInstance();
    if (local.containsKey(_CLIENTES.clientes)) {
      return local.getStringList(_CLIENTES.clientes) ?? [];
    }
    save([]);
    return [];
  }

  static Future<void> limparListaClientes() async {
    var local = await SharedPreferences.getInstance();
    if (local.containsKey(_CLIENTES.clientes)) {
      local.remove(_CLIENTES.clientes);
    }
  }
}
