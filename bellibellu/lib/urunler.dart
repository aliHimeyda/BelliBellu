import 'dart:io';

class Urunler {
  late String resimYolu;
  late double urunfiyati;
  late String urunAdi;
  late String urunAciklamasi;
  late int begenisayisi;
  static List<Urunler> urunler = [];
  Urunler() {
    resimYolu = "";
    urunfiyati = 0.0;
    urunAdi = "";
    urunAciklamasi = "";
    begenisayisi = 0;
  }
  static Future<void> urunleritanima() async {
    File file = File('urunbilgileri.txt');
    String content = await file.readAsString(); // 🔥 Dosyanın tamamını oku
    int index = 0;

    for (String satir in content.split('\n')) {
      // Satırları '\n' ile böldük
      if (satir.trim().isNotEmpty) {
        // Boş satırları atla
        Urunler u = Urunler();
        if (index % 5 == 0) u.resimYolu = satir;
        if (index % 5 == 1) u.urunAdi = satir;
        if (index % 5 == 2) u.urunfiyati = double.parse(satir);
        if (index % 5 == 3) u.urunAciklamasi = satir;
        if (index % 5 == 4) {
          u.begenisayisi = int.parse(satir);
          urunler.add(u); // �� Ürünleri listeye ekle
        }
        index++;
      }
    }
  }
}
