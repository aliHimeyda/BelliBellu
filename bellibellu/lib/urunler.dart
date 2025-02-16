// ignore: depend_on_referenced_packages
import 'package:bellibellu/generated/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Urunler {
  late String resimYolu;
  late double urunfiyati;
  late String urunAdi;
  late String urunAciklamasi;
  late int begenisayisi;
  late String materyali;
  late String turu;
  late String ortami;
  late String agirligi;
  late bool begenilmismi;

  static List<Urunler> urunler = [];
  Urunler() {
    resimYolu = "";
    urunfiyati = 0.0;
    urunAdi = "";
    urunAciklamasi = "";
    begenisayisi = 0;
    materyali = "";
    turu = "";
    ortami = "";
    agirligi = "";

    begenilmismi = false;
  }
  static Future<void> urunleritanima() async {
    
    List<String> satirlar;
    try {
      var url = Uri.parse(
        'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/urunbilgileri.txt',
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
         satirlar =
            response.body
                .split('\n')
                .where((line) => line.trim().isNotEmpty)
                .toList();
      } else {
        throw Exception("❌ Dosya yüklenemedi: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("🚨 Hata: $e");
    }
    final pref = await SharedPreferences.getInstance();
    final List<String>? begenilenler = await pref.getStringList(
      'begenilenurunler',
    );

    for (int i = 0; i < (satirlar.length); i += 9) {
      Urunler u = Urunler();
      u.resimYolu = satirlar[i];
      u.urunAdi = satirlar[i + 1];
      u.urunfiyati = double.parse(satirlar[i + 2]);
      u.urunAciklamasi = satirlar[i + 3];
      u.begenisayisi = int.parse(satirlar[i + 4]);
      u.materyali = satirlar[i + 5];
      u.turu = satirlar[i + 6];
      u.ortami = satirlar[i + 7];
      u.agirligi = satirlar[i + 8];

      if (begenilenler != null) {
        for (int i = 0; i < begenilenler.length; i++) {
          if (begenilenler[i] == u.urunAdi) {
            u.begenilmismi = true;
            break;
          }
        }
      }
      // �� Ürünleri listeye ekle
      urunler.add(u);
    }
  }
}
