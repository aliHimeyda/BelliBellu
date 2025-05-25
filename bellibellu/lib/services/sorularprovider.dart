import 'package:bellibellu/generated/l10n.dart';
import 'package:flutter/material.dart';

class Sorularprovider with ChangeNotifier {
  late int currentPage = 1;
  late List<Map<String, dynamic>> soru_cevaplar = [];
  late String siralamaolcutu = '';
  void guncelle() {
    notifyListeners();
  }
}
