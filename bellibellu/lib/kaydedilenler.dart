import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KaydedilenUrunler extends ChangeNotifier {
  static List<Urunkarti> begenilenUrunwidgeti = [];

  static Future<List<Urunkarti>> dataguncelle() async {
    final pref = await SharedPreferences.getInstance();
    debugPrint('Kaydedilenler giriliyor');

    List<String>? urunadlari = await pref.getStringList('begenilenurunler');

    debugPrint('setstate calisiyor...');

    if (urunadlari != null && urunadlari.isNotEmpty) {
      begenilenUrunwidgeti.clear();
      for (int i = 0; i < urunadlari.length; i++) {
        for (int j = 0; j < Urunler.urunler.length; j++) {
          if (Urunler.urunler[j].urunAdi == urunadlari[i]) {
            Urunkarti kart = Urunkarti(
              Urunler.urunler[j].resimYolu,
              Urunler.urunler[j].urunAdi,
              Urunler.urunler[j].urunfiyati,
              Urunler.urunler[j].urunAciklamasi,
              Urunler.urunler[j].begenisayisi,
              Urunler.urunler[j].materyali,
              Urunler.urunler[j].turu,
              Urunler.urunler[j].ortami,
              Urunler.urunler[j].agirligi,
              Urunler.urunler[j].begenilmismi,
            );
            begenilenUrunwidgeti.add(kart);
          }
        }
      }
    }

    debugPrint('kaydedilen urunlerin sayisi ${begenilenUrunwidgeti.length}');
    return begenilenUrunwidgeti;
  }
}

class Kaydedilenler extends StatefulWidget {
  const Kaydedilenler({super.key});

  @override
  State<Kaydedilenler> createState() => _KaydedilenlerState();
}

class _KaydedilenlerState extends State<Kaydedilenler> {
  List<Urunkarti> begenilenurunler = [];

  @override
  void initState() {
    super.initState();
    guncelle();
  }

  void guncelle() async {
    List<Urunkarti> yeniliste = await KaydedilenUrunler.dataguncelle();
    debugPrint(
      'setstate calisiyor .... yeniliste boyutu : ${yeniliste.length}',
    );

    setState(() {
      begenilenurunler = yeniliste;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(top: 50, bottom: 20),

            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      begenilenurunler.isNotEmpty
                          ? Wrap(
                            spacing: 20,
                            children: [
                              for (Urunkarti urun in begenilenurunler) urun,
                            ],
                          )
                          : Text('begenilen urun listesi bos !!'),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 20,

            child: SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: guncelle,

                child: Center(
                  child: Icon(
                    Icons.refresh,
                    size: 20,
                    color: Renkler.kahverengi,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Renkler.krem,
                  padding: EdgeInsets.zero, // Varsayılan padding'i kaldır),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
