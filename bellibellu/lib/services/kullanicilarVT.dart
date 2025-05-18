import 'dart:convert';

import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

class Kullanicilarvt {
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

  static Future<Map<String, dynamic>> getmusteriBymail(String email) async {
    debugPrint(email);
    final response = await http.get(
      Uri.parse('$baseUrl/musteri_bilgileri/$email'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('musteri: ${data['adi']}');

      return data;
    } else {
      print('Hata (kullanici bulunmadi): ${response.body}');
      return {};
    }
  }

  static Future<Map<String, dynamic>> getsaticiBymail(String email) async {
    debugPrint(email);
    final response = await http.get(
      Uri.parse('$baseUrl/satici_bilgileri/$email'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('satici: ${data['adi']}');

      return data;
    } else {
      print('Hata (kullanici bulunmadi): ${response.body}');
      return {};
    }
  }

  static Future<bool> musteribilgikontrolu(String email, String sifre) async {
    final response = await http.get(
      Uri.parse('$baseUrl/musteri_bilgi_kontrolu/$email/$sifre'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('musteri kontrol sonucu: ${data}');

      return data;
    } else {
      print('Hata (kullanici bulunmadi): ${response.body}');
      return false;
    }
  }

  static Future<bool> saticibilgikontrolu(String email, String sifre) async {
    final response = await http.get(
      Uri.parse('$baseUrl/satici_bilgi_kontrolu/$email/$sifre'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('satici kontrol sonucu: ${data}');

      return data;
    } else {
      print('Hata (satici bulunmadi): ${response.body}');
      return false;
    }
  }

  static Future<bool> updateMusteriBilgileri(
    Map<String, dynamic> musteri,
  ) async {
    try {
      // Tarihi SQL uyumlu formata çevir (yyyy-MM-dd)
      String isoTarih = DateFormat(
        'yyyy-MM-dd',
      ).format(DateFormat('dd.MM.yyyy').parse(musteri['dogumTarihi']));

      // Güncellenecek veriler
      final Map<String, dynamic> guncelVeri = {
        'id': musteri['kullaniciID'],
        'email': musteri['email'],
        'sifre': musteri['sifre'],
        'adi': musteri['adi'],
        'soyadi': musteri['soyadi'],
        'sectigiDil': musteri['sectigiDil'],
        'dogumTarihi': isoTarih,
        'adres': musteri['adres'],
      };

      // HTTP PUT isteği
      final response = await http.put(
        Uri.parse('$baseUrl/musteri_guncelle'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(guncelVeri),
      );

      if (response.statusCode == 200) {
        print('Güncelleme başarılı: ${response.body}');
        return true;
      } else {
        print('Sunucu hatası: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Hata oluştu: $e');
      return false;
    }
  }

  static Future<bool> updateSaticiBilgileri(Map<String, dynamic> satici) async {
    try {
      // Güncellenecek veriler
      final Map<String, dynamic> guncelVeri = {
        'id': satici['kullaniciID'],
        'email': satici['email'],
        'sifre': satici['sifre'],
        'adi': satici['adi'],
        'soyadi': satici['soyadi'],
        'telefon': satici['telefonNo'] ?? null,
        'cevrimicimi': satici['cevrimIciMi'],
      };

      // HTTP PUT isteği
      final response = await http.put(
        Uri.parse('$baseUrl/satici_guncelle'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(guncelVeri),
      );

      if (response.statusCode == 200) {
        print('Güncelleme başarılı: ${response.body}');
        return true;
      } else {
        print('Sunucu hatası: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Hata oluştu: $e');
      return false;
    }
  }
}
