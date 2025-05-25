import 'package:flutter/material.dart';

class Siparislerprovider with ChangeNotifier {
  late Map<String, List<Map<String, dynamic>>> siparisler = {};
  late List<Map<String, dynamic>> onaylanmisSiparisler = [];
  Future<void> siparisleriGuncelle() async {
    notifyListeners();
  }
}
