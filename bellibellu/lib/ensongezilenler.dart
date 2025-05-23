import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ensongezilenurunler extends ChangeNotifier {
  static List<Ozelurunkarti> begenilenUrunwidgeti = [];

  static Future<List<Ozelurunkarti>> dataguncelle() async {
    final pref = await SharedPreferences.getInstance();
    debugPrint('Kaydedilenler giriliyor');

    List<String>? urunadlari = await pref.getStringList('ensongezilenurunler');

    debugPrint('setstate calisiyor...');

    if (urunadlari != null && urunadlari.isNotEmpty) {
      begenilenUrunwidgeti.clear();
      if (urunadlari.length <= 15) {
        for (int i = 0; i < urunadlari.length; i++) {
          Map<String, dynamic> urun = await Urunlervt.getUrunByAd(
            urunadlari[i],
          );
          Ozelurunkarti kart = Ozelurunkarti(urun: urun);
          begenilenUrunwidgeti.add(kart);
        }
      } else {
        for (int i = urunadlari.length - 1; i > urunadlari.length - 16; i--) {
          Map<String, dynamic> urun = await Urunlervt.getUrunByAd(
            urunadlari[i],
          );
          Ozelurunkarti kart = Ozelurunkarti(urun: urun);
          begenilenUrunwidgeti.add(kart);
        }
      }
    }

    debugPrint('kaydedilen urunlerin sayisi ${begenilenUrunwidgeti.length}');
    return begenilenUrunwidgeti;
  }
}

class Ensongezilenler extends StatefulWidget {
  const Ensongezilenler({super.key});

  @override
  State<Ensongezilenler> createState() => _KaydedilenlerState();
}

class _KaydedilenlerState extends State<Ensongezilenler> {
  List<Ozelurunkarti> begenilenurunler = [];

  @override
  void initState() {
    super.initState();
    guncelle();
  }

  void guncelle() async {
    List<Ozelurunkarti> yeniliste = await Ensongezilenurunler.dataguncelle();
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
