import 'package:flutter/material.dart';

class Siparislerprovider with ChangeNotifier {
  late Map<String, List<Map<String, dynamic>>> siparisler = {};
  late List<Map<String, dynamic>> onaylanmisSiparisler = [];
  late Map<String, List<Map<String, dynamic>>> gecmissiparisler = {};
  late List<Map<String, dynamic>> faturadetayi = [];
  Future<void> siparisleriGuncelle() async {
    notifyListeners();
  }

  void urunleriTemizle() {
    // siparisler'i geçici olarak düzenleyeceğimiz bir kopya oluşturuyoruz
    final Map<String, List<Map<String, dynamic>>> temizlenmisSiparisler = {};

    siparisler.forEach((kategori, urunListesi) {
      // Bu kategori için filtrelenmiş (yani onaylanmamis) ürünler
      List<Map<String, dynamic>> filtrelenmisUrunler =
          urunListesi.where((urun) {
            // Eğer bu urun onaylanmisSiparisler içinde YOKSA, listede kalmaya devam eder
            return !onaylanmisSiparisler.any(
              (onayli) => onayli['urunID'] == urun['urunID'],
            );
          }).toList();

      // Eğer bu kategoride hâlâ ürün varsa, güncel listeyi ekle
      if (filtrelenmisUrunler.isNotEmpty) {
        temizlenmisSiparisler[kategori] = filtrelenmisUrunler;
      }
    });

    // Güncellenmiş siparisler’i atıyoruz
    siparisler = temizlenmisSiparisler;
    onaylanmisSiparisler.clear();
    notifyListeners();
  }
}
