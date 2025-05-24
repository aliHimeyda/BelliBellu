import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';
import 'package:bellibellu/renkler.dart';
import 'package:go_router/go_router.dart';
import 'package:grock/grock.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Urunkarti extends StatefulWidget {
  // String resimYolu;
  // double urunfiyati;
  // String urunAdi;
  // String urunAciklamasi;
  // int begenisayisi;
  // String materyali;
  // String turu;
  // String ortami;
  // String agirligi;
  // bool begenilmismi;
  final Map<String, dynamic> urun;
  Urunkarti({super.key, required this.urun});

  @override
  State<Urunkarti> createState() => _UrunkartiState();
}

class _UrunkartiState extends State<Urunkarti> {
  late bool begenilmismi = widget.urun['begenilmismi'] == 1 ? true : false;
  int urunKartiGenisligi = 150;

  get urun => this.urun;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await ensongezilenekaydet(widget.urun['urunAdi']);
        // Sayfa açıldığında dinleyici ekleyerek kapat
        context.push('/urundetaylari', extra: widget.urun['urunAdi']);
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
                      widget.urun['urunResmi'],
                      width: urunKartiGenisligi - 2,
                      height: urunKartiGenisligi * 1.2,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Text(
                widget.urun['urunAdi'],
                style: const TextStyle(
                  color: Renkler.kahverengi,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.urun['fiyat']} TL   ❤${widget.urun['begeniSayisi']}',
                style: const TextStyle(color: Renkler.kahverengi),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ozelurunkarti extends StatefulWidget {
  final Map<String, dynamic> urun;
  Ozelurunkarti({super.key, required this.urun});
  @override
  State<Ozelurunkarti> createState() => _OzelurunkartiState();
}

class _OzelurunkartiState extends State<Ozelurunkarti> {
  late bool begenilmismi = widget.urun['begenilmismi'] == 1 ? true : false;
  int urunKartiGenisligi = 150;

  get urun => this.urun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await ensongezilenekaydet(widget.urun['urunAdi']);
        // Sayfa açıldığında dinleyici ekleyerek kapat
        context.push('/urundetaylari', extra: widget.urun['urunAdi']);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width - 10,
          height: urunKartiGenisligi * 1.1,
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
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(10),
                    ),
                    child: Image.network(
                      widget.urun['urunResmi'],
                      width:
                          ((MediaQuery.of(context).size.width / 3) * 1.7) - 10,
                      height: urunKartiGenisligi * 1.1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: ((MediaQuery.of(context).size.width / 3) * 1.3) - 10,
                    height: urunKartiGenisligi * 1.1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.urun['urunAdi'],
                            style: const TextStyle(
                              color: Renkler.kahverengi,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '❤${widget.urun['begeniSayisi']}    ${widget.urun['fiyat']} TL',
                            style: const TextStyle(color: Renkler.kahverengi),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                      onPressed: () async {
                        debugPrint('${widget.urun['urunAdi']} tiklandi');
                        begenilmismi
                            ? begenilmismi = false
                            : begenilmismi = true;

                        if (begenilmismi) {
                          setState(() {
                            widget.colored(color: Renkler.kirmizi);
                          });
                          await begenilenekaydet(
                            widget.urun['urunID'],
                            Provider.of<Kullanicilarprovider>(
                              context,
                              listen: false,
                            ).currentkullanici['kullaniciID'],
                          );
                        } else {
                          setState(() {
                            widget.colored(color: Colors.white);
                          });
                          begenilendensil(
                            widget.urun['urunID'],
                            Provider.of<Kullanicilarprovider>(
                              context,
                              listen: false,
                            ).currentkullanici['kullaniciID'],
                          );
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: begenilmismi ? Renkler.kirmizi : Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> begenilenekaydet(int urunID, int kullaniciID) async {
  await Urunlervt.urunu_kaydedilenlere_kaydet(kullaniciID, urunID);
}

Future<void> ensongezilenekaydet(String urunadi) async {
  final pref = await SharedPreferences.getInstance();
  List<String>? ensongezilen = await pref.getStringList('ensongezilenurunler');
  Map<String, dynamic> urun = await Urunlervt.getgezilmisUrunByAd(urunadi);
  if (urun['urunAdi'] == urunadi) {
    if (ensongezilen.isEmpty) {
      await pref.setStringList('ensongezilenurunler', [urun['urunAdi']]);
    } else {
      if (!(ensongezilen!.contains(urun['urunAdi']))) {
        ensongezilen.add(urun['urunAdi']);
        await pref.setStringList('ensongezilenurunler', ensongezilen);
        debugPrint('keydedildi: $ensongezilen');
      }
    }
  }
}

Future<void> begenilendensil(int urunID, int kullaniciID) async {
  await Urunlervt.urunu_kaydedilenlerden_sil(kullaniciID, urunID);
}
