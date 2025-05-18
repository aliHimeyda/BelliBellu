import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Urunlervt {
    static const String baseUrl = 'http://10.0.2.2:3000';
  static Future<List<dynamic>> getKisiler() async {
    final response = await http.get(Uri.parse('$baseUrl/Kullanici'));

    if (response.statusCode == 200) {
      debugPrint('calisiyor , boyut : ${response.body.length}');
      return jsonDecode(response.body);
    } else {
      throw Exception('API başarısız: ${response.statusCode}');
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