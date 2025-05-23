import 'package:bellibellu/urunkarti.dart';
import 'package:flutter/widgets.dart';

class Urunlerprovider with ChangeNotifier {
  late int currentPage = 1;
  late List<Map<String, dynamic>> urunler = [];
  late List<Ozelurunkarti> urunkartlari = [];
  late List<Map<String, dynamic>> kategorikurunler = [];
  late List<String> secilimateryalOgeler = [];
  late List<String> seciliortamOgeler = [];
  late List<String> seciliturOgeler = [];
  late List<String> secilirenkOgeler = [];
  late List<Map<String, int>> secilifiyatOgeler = [];
  late String urunAdi = '';
  late String siralamaolcutu = "";
  late String tarihegore = '';
  late Map<String, dynamic> seridkategorisi = {};
  late List<Ozelurunkarti> ensongezilenurunler = [];
}
