import 'package:bellibellu/kaydedilenler.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logosayfasi extends StatefulWidget {
  const Logosayfasi({super.key});

  @override
  State<Logosayfasi> createState() => _LogosayfasiState();
}

class _LogosayfasiState extends State<Logosayfasi> {
  @override
  void initState() {
    dataal();
    
    Future.delayed(const Duration(seconds: 3), () {
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

  void dataal() async {
    if (Urunler.urunler.isEmpty) {
      await Urunler.urunleritanima();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kahverengi,
      body: Center(child: Image.asset('assets/logo.png')),
    );
  }
}
