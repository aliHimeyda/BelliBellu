import 'package:bellibellu/services/kullanicilarVT.dart';
import 'package:flutter/widgets.dart';

class Kullanicilarprovider with ChangeNotifier {
  late Map<String, dynamic> currentkullanici = {};
  late bool ismusteri = true;
  void degisikliklerikaydet() {
    notifyListeners();
  }
}
