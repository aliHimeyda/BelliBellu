import 'dart:convert';

import 'package:http/http.dart' as http;

class Sorularvt {
  static const String baseUrl = 'http://10.0.2.2:3000';

  static Future<List<Map<String, dynamic>>> sorulariGetir({
    required int urunID,
    int page = 1,
    int limit = 15,
    String siralamaOlcutu = "onerilen",
  }) async {
    final Uri uri = Uri.parse('$baseUrl/sorular').replace(
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

  static Future<bool> soruEkle({
    required int kullaniciID,
    required int urunID,
    required int saticiID,
    required String soruMetni,
  }) async {
    final url = Uri.parse("$baseUrl/soruekle");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "kullaniciID": kullaniciID,
        "urunID": urunID,
        "soruMetni": soruMetni,
        "saticiID": saticiID,
      }),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body["success"] == true;
    } else {
      print("Hata oluştu: ${response.body}");
      return false;
    }
  }

  static Future<bool> cevapEkle({
    required int kullaniciID,
    required String cevapmetni,
    required int musteriID,
    required int soruID,
    required int sohbetID,
  }) async {
    final url = Uri.parse("'$baseUrl'/cevapekle");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "kullaniciID": kullaniciID,
        "cevapmetni": cevapmetni,
        "musteriID": musteriID,
        "soruID": soruID,
        "sohbetID": sohbetID,
      }),
    );

    if (response.statusCode == 200) {
      print("Cevap eklendi: ${response.body}");
      return true;
    } else {
      print("Hata oluştu: ${response.body}");
      return false;
    }
  }
}
