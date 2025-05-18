import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarVT.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cihazbellegi {
  static bool? girisyapildimi;
  static Future<String?> girisyapanmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? girismaili = prefs.getString('girisyapanmail');
    return girismaili;
  }

  static Future<bool?> giriskontrolu() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('girisbilgisi');
    return repeat;
  }
}

class Logosayfasi extends StatefulWidget {
  const Logosayfasi({super.key});

  @override
  State<Logosayfasi> createState() => _LogosayfasiState();
}

class _LogosayfasiState extends State<Logosayfasi> {
  @override
  void initState() {
    giriskontrolu(context);
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

  void giriskontrolu(BuildContext context) async {
    Cihazbellegi.girisyapildimi = await Cihazbellegi.giriskontrolu();
    if (Cihazbellegi.girisyapildimi == true) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? mail = prefs.getString('girisyapanmail');
      debugPrint(mail);
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici = await Kullanicilarvt.getmusteriBymail(mail!);
    }
    debugPrint('giris bilgisi: ${Cihazbellegi.girisyapildimi}');
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
