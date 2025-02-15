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
    final ceviriler = S.current;
    List<String> aciklamalar = [
      ceviriler.urun1,
      ceviriler.urun2,
      ceviriler.urun3,
      ceviriler.urun4,
      ceviriler.urun5,
      ceviriler.urun6,
      ceviriler.urun7,
      ceviriler.urun8,
      ceviriler.urun9,
      ceviriler.urun10,
      ceviriler.urun11,
      ceviriler.urun12,
      ceviriler.urun13,
      ceviriler.urun14,
      ceviriler.urun15,
      ceviriler.urun16,
      ceviriler.urun17,
      ceviriler.urun18,
      ceviriler.urun19,
      ceviriler.urun20,
      ceviriler.urun21,
      ceviriler.urun22,
      ceviriler.urun23,
      ceviriler.urun24,
      ceviriler.urun25,
      ceviriler.urun26,
      ceviriler.urun27,
      ceviriler.urun28,
      ceviriler.urun29,
      ceviriler.urun30,
      ceviriler.urun31,
      ceviriler.urun32,
      ceviriler.urun33,
      ceviriler.urun34,
      ceviriler.urun35,
      ceviriler.urun36,
      ceviriler.urun37,
      ceviriler.urun38,
      ceviriler.urun39,
      ceviriler.urun40,
      ceviriler.urun41,
      ceviriler.urun42,
      ceviriler.urun43,
      ceviriler.urun44,
      ceviriler.urun45,
      ceviriler.urun46,
      ceviriler.urun47,
      ceviriler.urun48,
      ceviriler.urun49,
      ceviriler.urun50,
    ];
    List<String> satirlar;
    try {
      // 🔥 GitHub'dan dosyayı çeken URL (sen kendi URL'ni yazmalısın)
      var url = Uri.parse(
        'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/urunbilgileri.txt',
      );
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ✅ Dosya içeriğini satır satır böl ve liste olarak döndür
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
      u.urunAciklamasi = aciklamalar[(i / 9).toInt()];
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
