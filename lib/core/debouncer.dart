import 'dart:async';

import 'package:flutter/widgets.dart';

class Debouncer {
  Timer? _timer;

  Debouncer();

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 500), action);
  }
}
