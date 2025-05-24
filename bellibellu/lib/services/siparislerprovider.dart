import 'package:flutter/material.dart';

class Siparislerprovider with ChangeNotifier {
  late Map<String, List<Map<String, dynamic>>> siparisler = {};
  void siparisleriGuncelle() {
    notifyListeners();
  }
}
