import 'package:bellibellu/urunler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hafizaislemleri {
  static Future<void> bellektekiUrunleriGuncelle() async {
    final pref = await SharedPreferences.getInstance();
    for (int i = 0; i < Urunler.urunler.length; i++) {
      await pref.setStringList('$i.urun', [
        Urunler.urunler[i].resimYolu,
        Urunler.urunler[i].urunAdi,
        Urunler.urunler[i].urunfiyati.toString(),
        Urunler.urunler[i].urunAciklamasi,
        Urunler.urunler[i].begenisayisi.toString(),
        Urunler.urunler[i].materyali,
        Urunler.urunler[i].turu,
        Urunler.urunler[i].ortami,
        Urunler.urunler[i].agirligi,
        Urunler.urunler[i].begenilmismi.toString(),
      ]);
    }
  }
}
