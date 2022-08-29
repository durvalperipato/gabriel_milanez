import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  final BodyWidget type;

  const BodyWidget({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
