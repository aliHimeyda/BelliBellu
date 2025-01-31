
import 'package:bellibellu/logosayfasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Program());
}

class Program extends StatelessWidget {
  const Program({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Logosayfasi(),
      

    );
  }
}
