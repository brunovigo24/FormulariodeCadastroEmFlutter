import 'package:flutter/material.dart';
import 'package:flutter_prova/MeuFormulario.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MeuFormulario(),
    );
  }
}

