import 'package:bellibellu/generated/l10n.dart';
import 'package:flutter/material.dart';

class Cevirici {
  static String translate(BuildContext context, String turkceMetin) {
    final ceviriler = S.of(context);

    // Çeviriyi almak için map yöntemi
    Map<String, String> ceviriMap = {
      "masa": ceviriler.masaonerisi,
      "sandalye": ceviriler.sandalyeonerisi,
      "metal masa": ceviriler.metalmasaonerisi,
      "ofis mobilyası": ceviriler.ofisMobilyalarionerisi,
      "ev mobilyası": ceviriler.evMobilyaUrunlerionerisi,
      "ahşap ürünler": ceviriler.ahsapUrunleronerisi,
      "kafe mobilyası": ceviriler.ahsapUrunleronerisi,
    };

    // Eğer çeviri bulunuyorsa çevirilmiş metni döndür, yoksa orijinal Türkçeyi kullan
    return ceviriMap[turkceMetin.toLowerCase()] ?? turkceMetin;
  }

  static String malzemeCevir(BuildContext context, String turkceMetin) {
    final ceviriler = S.of(context);
    Map<String, String> malzemeMap = {
      "Çelik": ceviriler.celik,
      "Ahşap": ceviriler.ahsap,
      "Metal": ceviriler.metal,
    };

    return malzemeMap[turkceMetin] ?? turkceMetin;
  }

  static String ortamCevir(BuildContext context, String turkceMetin) {
    final ceviriler = S.of(context);
    Map<String, String> ortamMap = {
      "Ev": ceviriler.ev,
      "Ofis": ceviriler.ofis,
      "Kafe": ceviriler.kafe,
    };

    return ortamMap[turkceMetin] ?? turkceMetin;
  }

  static String turCevir(BuildContext context, String turkceMetin) {
    final ceviriler = S.of(context);
    Map<String, String> turMap = {
      "Masa": ceviriler.masa,
      "Sandalye": ceviriler.sandalye,
    };

    return turMap[turkceMetin] ?? turkceMetin;
  }
}
