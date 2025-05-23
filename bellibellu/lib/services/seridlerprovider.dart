import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';

class Seridlerprovider with ChangeNotifier {
  late List<Serid> seridler = [];
  void seridleriguncelle() {
    notifyListeners();
  }
}
