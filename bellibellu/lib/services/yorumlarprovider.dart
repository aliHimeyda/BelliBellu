import 'package:flutter/material.dart';

class Yorumlarprovider with ChangeNotifier {
  late int currentPage = 1;
  late List<Map<String, dynamic>> yorumlar = [];
  late String siralamaolcutu = "";
  void guncelle() {
    notifyListeners();
  }
}
