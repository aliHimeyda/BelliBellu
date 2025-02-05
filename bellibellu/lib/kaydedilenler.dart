import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Kaydedilenler extends StatefulWidget {
  const Kaydedilenler({super.key});

  @override
  State<Kaydedilenler> createState() => _KaydedilenlerState();
}

class _KaydedilenlerState extends State<Kaydedilenler>
    with AutomaticKeepAliveClientMixin {
  List<Urunler> begenilenurunler = [];
  @override
  void initState() {
    dataguncelle();
    super.initState();
  }

  void dataguncelle() async {
    final pref = await SharedPreferences.getInstance();
    debugPrint('Kaydedilenler giriliyor');

    List<String>? urunadlari = await pref.getStringList('begenilenurunler');

    if (urunadlari != null && urunadlari.isNotEmpty) {
      List<Urunler> yeniListe = [];
      for (int i = 0; i < urunadlari.length; i++) {
        for (int j = 0; j < Urunler.urunler.length; j++) {
          if (Urunler.urunler[j].urunAdi == urunadlari[i]) {
            begenilenurunler.add(Urunler.urunler[j]);
          }
        }
      }
      setState(() {
        begenilenurunler = yeniListe; // UI'yi yenile
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   build(context);
    // });

    debugPrint('kaydedilenler build edildi ');
    super.build(context); // Mixin'in sağladığı "keepAlive" durumu
    return Scaffold(
      body: ListView(
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
                          for (Urunler urun in begenilenurunler)
                            Urunkarti(
                              urun.resimYolu,
                              urun.urunAdi,
                              urun.urunfiyati,
                              urun.urunAciklamasi,
                              urun.begenisayisi,
                              urun.materyali,
                              urun.turu,
                              urun.ortami,
                              urun.agirligi,
                              urun.begenilmismi,
                            ),
                        ],
                      )
                      : Text('begenilen urun listesi bos !!'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: dataguncelle, // Listeyi yenile
        child: Icon(Icons.refresh),
      ),
    );
  }

  @override
  bool get wantKeepAlive => false; // İçeriği bellekte tutma, her seferinde yeniden build et
}
