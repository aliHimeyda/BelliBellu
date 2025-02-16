import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: Dildestegiprovaider.current,
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
      if (Urunler.urunler.isEmpty) {
        await Urunler.urunleritanima();
      }
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
