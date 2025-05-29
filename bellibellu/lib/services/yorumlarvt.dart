import 'dart:convert';

import 'package:http/http.dart' as http;

class Yorumlarvt {
  static const String baseUrl = 'https://d713-92-45-16-34.ngrok-free.app';

  static Future<List<Map<String, dynamic>>> yorumlariGetir({
    required int urunID,
    int page = 1,
    int limit = 15,
    String siralamaOlcutu = "enyeni", // seçenek: "enyeni", "eneski", vs.
  }) async {
    final Uri uri = Uri.parse('$baseUrl/yorumlar').replace(
      queryParameters: {
        'urunID': urunID.toString(),
        'page': page.toString(),
        'limit': limit.toString(),
        'siralamaolcutu': siralamaOlcutu,
      },
    );

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print("Sunucu hatası: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Hata oluştu: $e");
      return [];
    }
  }

  static Future<bool> yorumEkle({
    required int urunID,
    required int kullaniciID,
    required String yorumMetni,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/yorumekle'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "urunID": urunID,
        "kullaniciID": kullaniciID,
        "yorumMetni": yorumMetni,
      }),
    );

    if (response.statusCode == 200) {
      print("Yorum başarıyla eklendi");
      return true;
    } else {
      print("Hata oluştu: ${response.body}");
      return false;
    }
  }
}
