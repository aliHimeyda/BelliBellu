import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Seridlerprovider with ChangeNotifier {
  late List<Serid> seridler = [];
  void seridleriguncelle(BuildContext context) async {
    await seridlerial(context);
    notifyListeners();
  }

  Future<void> seridlerial(BuildContext context) async {
    seridler.clear();
    final List<String> vasiflar = [
      S.of(context).urunSerisi2025,
      S.of(context).efsaneUrunler,
      S.of(context).ofisMobilyalari,
      S.of(context).evUrunleri,
      S.of(context).enCokBegenilenler,
    ];
    final List<Map<String, dynamic>> kategoriler = [
      {'currentPage': 1, 'tarihegore': "2025"},
      {'currentPage': 1},
      {
        'currentPage': 1,
        'seciliortamOgeler': ["Ofis"],
      },
      {
        'currentPage': 1,
        'seciliortamOgeler': ["Ev"],
      },
      {'currentPage': 1, 'siralamaolcutu': "encokbegenilen"},
    ];
    for (int i = 0; i < 5; i++) {
      Serid serid = Serid(vasif: vasiflar[i], seridkategorisi: kategoriler[i]);
      seridler.add(serid);
    }
  }
}
