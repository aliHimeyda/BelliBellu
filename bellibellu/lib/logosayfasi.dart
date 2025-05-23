import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarVT.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/seridlerprovider.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunlerseridi.dart';
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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    seridlerial();
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

  void seridlerial() async {
    final List<String> vasiflar = [
      S.of(context).urunSerisi2025,
      S.of(context).efsaneUrunler,
      S.of(context).ofisMobilyalari,
      S.of(context).evUrunleri,
      S.of(context).enCokBegenilenler,
    ];
    final List<Map<String, dynamic>> kategoriler = [
      {'currentPage': 1, 'tarihegore': "2025"},
      {'currentPage': 1},
      {
        'currentPage': 1,
        'seciliortamOgeler': ["Ofis"],
      },
      {
        'currentPage': 1,
        'seciliortamOgeler': ["Ev"],
      },
      {'currentPage': 1, 'siralamaolcutu': "encokbegenilen"},
    ];
    for (int i = 0; i < 5; i++) {
      Serid serid = Serid(vasif: vasiflar[i], seridkategorisi: kategoriler[i]);
      Provider.of<Seridlerprovider>(context).seridler.add(serid);
    }
    Provider.of<Seridlerprovider>(context).seridleriguncelle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kahverengi,
      body: Center(child: Image.asset('assets/logo.png')),
    );
  }
}
