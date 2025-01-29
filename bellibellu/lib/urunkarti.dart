import 'package:flutter/material.dart';
import 'package:bellibellu/renkler.dart';

// ignore: must_be_immutable
class Urunkarti extends StatelessWidget {
  String resimYolu;
  double urunfiyati;
  String urunAdi;
  String urunAciklamasi;
  int begenisayisi;
  final int urunKartiGenisligi = 150;
  Urunkarti(this.resimYolu, this.urunAdi, this.urunfiyati, this.urunAciklamasi,
      this.begenisayisi,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: urunKartiGenisligi - 2,
        height: urunKartiGenisligi * 1.8,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Renkler.krem,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Renkler.kahverengi),
            boxShadow: const [
              BoxShadow(
                  color: Renkler.gri,
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(2, 5))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Stack(children: [
                  Image.network(
                    resimYolu,
                    width: urunKartiGenisligi - 2,
                    height: urunKartiGenisligi * 1.2,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              color: Renkler.krem,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Renkler.kahverengi,
                              )),
                          child: Center(
                            child: IconButton(
                              padding: const EdgeInsets.all(0),
                              onPressed: () => debugPrint('tiklandi'),
                              icon: const Icon(Icons.favorite,
                                  color: Colors.white, size: 15),
                            ),
                          )))
                ])),
            Text(
              urunAdi,
              style: TextStyle(
                  color: Renkler.kahverengi, fontWeight: FontWeight.bold),
            ),
            Text(
              '$urunfiyati TL   ❤$begenisayisi',
              style: TextStyle(color: Renkler.kahverengi),
            ),
          ],
        ),
      ),
    );
  }
}
