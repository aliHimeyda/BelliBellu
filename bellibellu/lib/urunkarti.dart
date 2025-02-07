import 'package:bellibellu/kaydedilenler.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:bellibellu/renkler.dart';
import 'package:grock/grock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Urunkarti extends StatefulWidget {
  String resimYolu;
  double urunfiyati;
  String urunAdi;
  String urunAciklamasi;
  int begenisayisi;
  String materyali;
  String turu;
  String ortami;
  String agirligi;
  bool begenilmismi;

  Urunkarti(
    this.resimYolu,
    this.urunAdi,
    this.urunfiyati,
    this.urunAciklamasi,
    this.begenisayisi,
    this.materyali,
    this.turu,
    this.ortami,
    this.agirligi,
    this.begenilmismi, {
    super.key,
  });

  @override
  State<Urunkarti> createState() => _UrunkartiState();
}

class _UrunkartiState extends State<Urunkarti> {
  int urunKartiGenisligi = 150;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('tiklandi');
      },
      child: ClipRRect(
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
                offset: Offset(2, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      widget.resimYolu,
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
                          border: Border.all(color: Renkler.kahverengi),
                        ),
                        child: Center(
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              debugPrint('${widget.urunAdi} tiklandi');
                              widget.begenilmismi
                                  ? widget.begenilmismi = false
                                  : widget.begenilmismi = true;
                              setState(() {
                                if (widget.begenilmismi) {
                                  widget.colored(color: Renkler.kirmizi);
                                  begenilenekaydet(widget.urunAdi);
                                } else {
                                  widget.colored(color: Colors.white);
                                  begenilendensil(widget.urunAdi);
                                }
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  widget.begenilmismi
                                      ? Renkler.kirmizi
                                      : Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.urunAdi,
                style: const TextStyle(
                  color: Renkler.kahverengi,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.urunfiyati} TL   ❤${widget.begenisayisi}',
                style: const TextStyle(color: Renkler.kahverengi),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void begenilenekaydet(String urunadi) async {
  final pref = await SharedPreferences.getInstance();
  List<String>? begenilen = await pref.getStringList('begenilenurunler');
  for (int i = 0; i < Urunler.urunler.length; i++) {
    if (Urunler.urunler[i].urunAdi == urunadi) {
      Urunler.urunler[i].begenilmismi = true;

      if (begenilen.isEmpty) {
        await pref.setStringList('begenilenurunler', [
          Urunler.urunler[i].urunAdi,
        ]);
      } else {
        begenilen!.add(Urunler.urunler[i].urunAdi);
        await pref.setStringList('begenilenurunler', begenilen);
        debugPrint('keydedildi: $begenilen');
        break;
      }
    }
  }
  
}

void begenilendensil(String urunadi) async {
  final pref = await SharedPreferences.getInstance();
  List<String>? begenilen = await pref.getStringList('begenilenurunler');
  for (int i = 0; i < Urunler.urunler.length; i++) {
    if (Urunler.urunler[i].urunAdi == urunadi) {
      Urunler.urunler[i].begenilmismi = false;

      if (begenilen.isEmpty) {
        await pref.setStringList('begenilenurunler', [
          Urunler.urunler[i].urunAdi,
        ]);
      } else {
        begenilen!.remove(Urunler.urunler[i].urunAdi);
        await pref.setStringList('begenilenurunler', begenilen);
        debugPrint('keydedildi: $begenilen');
        break;
      }
    }
  }
  
}
