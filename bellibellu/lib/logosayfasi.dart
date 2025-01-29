import 'package:bellibellu/anasayfa.dart';
import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';

class Logosayfasi extends StatefulWidget {
  const Logosayfasi({super.key});

  @override
  State<Logosayfasi> createState() => _LogosayfasiState();
}

class _LogosayfasiState extends State<Logosayfasi> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Anasayfa()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Renkler.kahverengi,
        body: Center(child: Image.asset('lib/icons/logo.png')));
  }
}
