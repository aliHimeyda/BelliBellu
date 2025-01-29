
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'logosayfasi.dart';

void main() {
  runApp(const Program());
}

class Program extends StatelessWidget {
  const Program({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        navigatorKey: Grock.navigationKey,
        scaffoldMessengerKey: Grock.scaffoldMessengerKey,
        home: const Logosayfasi());
  }
}
