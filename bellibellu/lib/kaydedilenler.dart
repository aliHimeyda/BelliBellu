import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KaydedilenUrunler extends ChangeNotifier {
  static List<Ozelurunkarti> begenilenUrunwidgeti = [];

  static Future<List<Ozelurunkarti>> dataguncelle() async {
    final pref = await SharedPreferences.getInstance();
    debugPrint('Kaydedilenler giriliyor');

    List<String>? urunadlari = await pref.getStringList('begenilenurunler');

    debugPrint('setstate calisiyor...');

    if (urunadlari != null && urunadlari.isNotEmpty) {
      begenilenUrunwidgeti.clear();
      for (int i = 0; i < urunadlari.length; i++) {
        for (int j = 0; j < Urunler.urunler.length; j++) {
          if (Urunler.urunler[j].urunAdi == urunadlari[i]) {
            // Ozelurunkarti kart = Ozelurunkarti(urun: Urunler.urunler[j]);
            // begenilenUrunwidgeti.add(kart);
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
  List<Ozelurunkarti> begenilenurunler = [];

  @override
  void initState() {
    super.initState();
    guncelle();
  }

  void guncelle() async {
    List<Ozelurunkarti> yeniliste = await KaydedilenUrunler.dataguncelle();
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
                            runSpacing: 20,
                            spacing: 20,
                            children: [
                              for (Ozelurunkarti urun in begenilenurunler) urun,
                            ],
                          )
                          : Text(
                            S.of(context).begenilen_urun_listesi_bos,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
