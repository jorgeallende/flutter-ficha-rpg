import 'package:flutter/material.dart';
import 'package:primeiro_flutter/screens/unit-converter-screen.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Unidade',
      home: UnitConverterScreen(),
    );
  }
}