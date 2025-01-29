import 'dart:io';

import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Serid extends StatelessWidget {
  String vasif;
  int sayi;
  Serid(this.vasif, this.sayi, {super.key});
  // Dosya okuma fonksiyonu (asenkron)
  Future<String> dosyaOku() async {
    File file = File('urunbilgileri.txt'); // Dosya yolu
    return await file.readAsString(); // Dosyanın tamamını oku
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: Urunler.urunleritanima(), // Dosya okuma işlemini başlat
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            debugPrint("🚨 Hata: ${snapshot.error}");
            return const Center(child: Text('Dosya okunurken hata oluştu!'));
          } else {
            debugPrint("✔ Hata yok ");
            List<Urunler> content = Urunler.urunler;

            return Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '$vasif"tan $sayi adet var !',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Yatay kaydırmayı aktif et
                  child: Wrap(
                    spacing: 10,
                    children: [
                      // for (Urunler urun in Urunler.urunler)
                      //   Urunkarti(urun.resimYolu, urun.urunAdi, urun.urunfiyati,
                      //       urun.urunAciklamasi, urun.begenisayisi)
                      Urunkarti('lib/images/resim2.png', 'df', 34,
                          'dskfjdsklfjkldsjfklds', 43),
                      Urunkarti('lib/images/resim3.png', 'df', 34,
                          'dskfjdsklfjkldsjfklds', 43),
                      Urunkarti('lib/images/resim4.png', 'df', 34,
                          'dskfjdsklfjkldsjfklds', 43),
                      Urunkarti('lib/images/resim5.png', 'df', 34,
                          'dskfjdsklfjkldsjfklds', 43),
                      Urunkarti('lib/images/resim6.png', 'df', 34,
                          'dskfjdsklfjkldsjfklds', 43),
                    ],
                  ),
                )
              ],
            );
          }
        });
  }
}
