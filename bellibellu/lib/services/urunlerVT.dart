import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Urunlervt {
  static const String baseUrl = 'http://10.0.2.2:3000';
  static bool loadmore = false;
  static Future<List<Map<String, dynamic>>> getMoreUrun(
    int page,
    List<String>? secilimateryalOgeler,
    List<String>? seciliortamOgeler,
    List<String>? seciliturOgeler,
    List<Map<String, int>>? secilifiyatOgeler,
    String? siralamaolcutu,
    String? arananurunAdi,
    String? tarihegore,
  ) async {
    
    final limit = 15;
    String materyalJson = jsonEncode(secilimateryalOgeler);
    String ortamJson = jsonEncode(seciliortamOgeler);
    String turJson = jsonEncode(seciliturOgeler);
    String fiyatJson = jsonEncode(secilifiyatOgeler);

    final uri = Uri.parse('$baseUrl/Urunler').replace(
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        'secilimateryalOgeler': materyalJson,
        'seciliortamOgeler': ortamJson,
        'seciliturOgeler': turJson,
        'secilifiyatOgeler': fiyatJson,
        'secilirenkOgeler': fiyatJson,
        'siralamaolcutu': siralamaolcutu,
        'arananurunAdi': arananurunAdi,
        'tarihegore': tarihegore,
      },
    );
    loadmore = true;
    final response = await http.get(uri);
    loadmore = false;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Ürünler alınamadı');
    }
  }

  static Future<Map<String, dynamic>> getUrunByAd(String urunAdi) async {
    debugPrint(urunAdi);
    final response = await http.get(
      Uri.parse('$baseUrl/gezilmis_urun_kontrolu/$urunAdi'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('urun adi: ${data['urunAdi']}');

      return data;
    } else {
      print('Hata (urun: ${urunAdi} bulunmadi): ${response.body}');
      return {};
    }
  }

  static Future<bool> getKullaniciById(int id) async {
    debugPrint(id.toString());
    final response = await http.get(Uri.parse('$baseUrl/Kullanici/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Kullanıcı: ${data}');
      return true;
    } else {
      print('Hata (kullanici bulunmadi): ${response.body}');
      return false;
    }
  }
}
