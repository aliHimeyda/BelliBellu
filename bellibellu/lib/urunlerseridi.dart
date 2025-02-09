import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grock/grock.dart';

// ignore: must_be_immutable
class Serid extends StatefulWidget {
  String vasif;
  int sayi;
  Serid(this.vasif, this.sayi, {super.key});

  @override
  State<Serid> createState() => _SeridState();
}

class _SeridState extends State<Serid> {
  // final Future<void> _urunlerFuture =
  @override
  Widget build(BuildContext context) {
    const int urunKartiGenisligi = 150;
    int arttirma = Urunler.urunler.length ~/ widget.sayi;
    debugPrint(arttirma.toString());
    debugPrint('${widget.vasif} olusturuldu');

    // return FutureBuilder<void>(
    //     // future: _urunlerFuture, // Dosya okuma işlemini başlat
    //     // builder: (context, snapshot) {
    //     //   if (snapshot.connectionState == ConnectionState.waiting) {
    //     //     return const Center(
    //     //         child: CircularProgressIndicator()); // Yükleniyor göstergesi
    //     //   } else if (snapshot.hasError) {
    //     //     debugPrint("🚨 Hata: ${snapshot.error}");
    //     //     return const Center(child: Text('Dosya okunurken hata oluştu!'));
    //     //   } else {
    //     //     debugPrint("✔ Hata yok ");

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width - 10,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Yatayda yan yana düzenlemeyi aktif et
            children: [
              Text(
                widget.vasif,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('tiklandi');
                },
                child: const Row(
                  children: [
                    Text(
                      'Tum Urunler',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Renkler.kahverengi,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 15,
                      color: Renkler.kahverengi,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Yatay kaydırmayı aktif et
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Wrap(
              spacing: 10,
              children: [
                for (
                  int i = random.nextInt(9);
                  i < Urunler.urunler.length;
                  i += arttirma
                )
                  Urunkarti(urun: Urunler.urunler[i]),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: urunKartiGenisligi - 2,
                    height: urunKartiGenisligi * 1.8,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Renkler.krem, Renkler.kuyubeyaz],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Renkler.gri),
                      boxShadow: const [
                        BoxShadow(
                          color: Renkler.gri,
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(2, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        debugPrint('tiklandi');
                        context.push('/tumurunler'); // Sayfaya nesneyi geçir)
                      },
                      child: Center(
                        // 📌 Ana container içindeki her şeyi ortalamak için
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center, // 📌 Dikey eksende ortala
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .center, // 📌 Yatay eksende ortala
                          children: [
                            const Text(
                              'Tüm Urunler',
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontWeight: FontWeight.bold,
                                fontSize: 15, // 📌 Daha okunaklı hale getirdik
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ), // 📌 Metin ile ikon arasına boşluk ekledik
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape:
                                    BoxShape.circle, // 📌 Yuvarlak çerçeve için
                                border: Border.all(
                                  color: Renkler.kahverengi,
                                  width: 2,
                                ), // 📌 Çerçeve ekledik
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 25,
                                  color: Renkler.kahverengi,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
