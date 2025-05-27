import 'package:bellibellu/services/kullanicilarVT.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:flutter/widgets.dart';

class Kullanicilarprovider with ChangeNotifier {
  late Map<String, dynamic> currentkullanici = {};
  late List<Ozelurunkarti> saticiurunleri = [];
  late bool ismusteri = true;
  void degisikliklerikaydet() {
    notifyListeners();
  }
}
