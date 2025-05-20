import 'package:flutter/material.dart';

class Loadingprovider with ChangeNotifier {
  late bool isloading = false;
  void changemode() {
    isloading = !isloading;
    notifyListeners();
  }
}
