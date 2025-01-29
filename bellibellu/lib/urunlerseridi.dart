import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Serid extends StatelessWidget {
  String vasif;
  Serid(this.vasif, {super.key});

  @override
  Widget build(BuildContext context) {
    const int urunKartiGenisligi = 150;

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
                Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 80,
                  child: Text(
                    '$vasif  Urunleri',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Yatay kaydırmayı aktif et
                  child: Wrap(
                    spacing: 10,
                    children: [
                      for (Urunler urun in content)
                        Urunkarti(urun.resimYolu, urun.urunAdi, urun.urunfiyati,
                            urun.urunAciklamasi, urun.begenisayisi),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: urunKartiGenisligi - 2,
                          height: urunKartiGenisligi * 1.8,
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: const [Renkler.krem, Renkler.kuyubeyaz],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Renkler.gri),
                            boxShadow: const [
                              BoxShadow(
                                color: Renkler.gri,
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(2, 5),
                              )
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Ürün detay sayfasına yönlendirme işlemi
                            },
                            child: Center(
                              // 📌 Ana container içindeki her şeyi ortalamak için
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // 📌 Dikey eksende ortala
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // 📌 Yatay eksende ortala
                                children: [
                                  Text(
                                    'Tüm Urunler',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          15, // 📌 Daha okunaklı hale getirdik
                                    ),
                                  ),
                                  const SizedBox(
                                      height:
                                          10), // 📌 Metin ile ikon arasına boşluk ekledik
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape
                                          .circle, // 📌 Yuvarlak çerçeve için
                                      border: Border.all(
                                          color: Renkler.kahverengi,
                                          width: 2), // 📌 Çerçeve ekledik
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.chevron_right,
                                        size: 25,
                                        color: Renkler.kahverengi,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
        });
  }
}
