import 'package:flutter/widgets.dart';

class Mesajlarprovider with ChangeNotifier {
  late List<Map<String, dynamic>> mesajlar = [];
  late List<Map<String, dynamic>> chatsohbetleri = [];
  late List<Map<String, dynamic>> sorusohbetleri = [];
  void guncelle() {
    notifyListeners();
  }
}
