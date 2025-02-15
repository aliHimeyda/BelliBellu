import 'package:flutter/material.dart';

class Dildestegiprovaider extends ChangeNotifier {
  static Locale current = const Locale('tr');

  void setturkish() {
    current = const Locale('tr');
    notifyListeners();
  }

  void setenglish() {
    current = const Locale('en');
    notifyListeners();
  }

  void setarabic() {
    current = const Locale('ar');
    notifyListeners();
  }
}
