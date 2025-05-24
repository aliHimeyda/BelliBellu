import 'dart:convert';

import 'package:http/http.dart' as http;

class Siparislervt {
  static const String baseUrl = 'http://10.0.2.2:3000';

  static Future<bool> siparisEkle(int kullaniciID, int urunID) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/siparis_ekle'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'kullaniciID': kullaniciID, 'urunID': urunID}),
      );

      if (response.statusCode == 200) {
        print(" Sipariş başarıyla eklendi");
        return true;
      } else {
        print(" Hata: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      print(" Hata oluştu: $e");
      return false;
    }
  }

  static Future<bool> siparistenUrunSil(int kullaniciID, int urunID) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/siparis_sil'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'kullaniciID': kullaniciID, 'urunID': urunID}),
      );

      if (response.statusCode == 200) {
        print(" Ürün siparişten silindi.");
        return true;
      } else {
        print(" Sunucu hatası: ${response.statusCode} - ${response.body}");
        return false;
      }
    } catch (e) {
      print(" Hata oluştu: $e");
      return false;
    }
  }

  static Future<Map<String, List<Map<String, dynamic>>>> tumSiparisleriGetir(
    int kullaniciID,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/tum_siparisler/$kullaniciID'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.body);

        final Map<String, List<Map<String, dynamic>>> groupedSiparisler = {};

        decodedJson.forEach((key, value) {
          // value burada List<dynamic> olacak, onu List<Map<String, dynamic>>'e cast ediyoruz
          groupedSiparisler[key] = List<Map<String, dynamic>>.from(value);
        });

        return groupedSiparisler;
      } else {
        print(" Hata: ${response.statusCode} - ${response.body}");
        return {};
      }
    } catch (e) {
      print(" İstek sırasında hata oluştu: $e");
      return {};
    }
  }
}
