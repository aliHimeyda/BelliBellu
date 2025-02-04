import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';

class Logosayfasi extends StatefulWidget {
  const Logosayfasi({super.key});

  @override
  State<Logosayfasi> createState() => _LogosayfasiState();
}

class _LogosayfasiState extends State<Logosayfasi> {
  @override
  void initState() {
    Urunler.urunleritanima();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder:
              (context) => MaterialApp.router(
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kahverengi,
      body: Center(child: Image.asset('assets/logo.png')),
    );
  }
}
