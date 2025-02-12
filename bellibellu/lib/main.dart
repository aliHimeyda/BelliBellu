import 'package:bellibellu/logosayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';





void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.brown, // 🔥 Burayı değiştirebilirsin
    statusBarIconBrightness: Brightness.light, // 🔥 İkonları beyaz yapmak için
  ));

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
