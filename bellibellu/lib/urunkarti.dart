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
        height: urunKartiGenisligi * 1.5,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 227, 227, 227),
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
              child: Image.asset(
                resimYolu,
                width: urunKartiGenisligi - 2,
                height: urunKartiGenisligi - 2,
                fit: BoxFit.cover,
              ),
            ),
            Text(urunAdi),
            Text('Fiyat: $urunfiyati Begeni: $begenisayisi'),
          ],
        ),
      ),
    );
  }
}
