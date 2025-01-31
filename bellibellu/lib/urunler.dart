// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

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
  }
  static Future<void> urunleritanima() async {
    List<String> satirlar;
    try {
      // 🔥 GitHub'dan dosyayı çeken URL (sen kendi URL'ni yazmalısın)
      var url = Uri.parse(
          'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/urunbilgileri.txt');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // ✅ Dosya içeriğini satır satır böl ve liste olarak döndür
        satirlar = response.body
            .split('\n')
            .where((line) => line.trim().isNotEmpty)
            .toList();
      } else {
        throw Exception("❌ Dosya yüklenemedi: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("🚨 Hata: $e");
    }

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
      // �� Ürünleri listeye ekle
      urunler.add(u);
    }
  }
}
