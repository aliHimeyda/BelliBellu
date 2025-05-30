import 'dart:convert';
import 'package:http/http.dart' as http;

class Mesajlarvt {
  static const String baseUrl = 'http://10.0.2.2:3000';
  static Future<List<Map<String, dynamic>>> mesajlariGetir({
    required int sohbetID,
  }) async {
    final url = Uri.parse('$baseUrl/mesajlarigetir/$sohbetID');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print("Hata: ${response.statusCode} - ${response.body}");
        return [];
      }
    } catch (e) {
      print("İstek sırasında hata oluştu: $e");
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> yenimesajlariGetir({
    required int kullaniciID,
    required int sohbetID,
  }) async {
    final url = Uri.parse('$baseUrl/yenimesajlarigetir/$kullaniciID/$sohbetID');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        print("Hata: ${response.statusCode} - ${response.body}");
        return [];
      }
    } catch (e) {
      print("İstek sırasında hata oluştu: $e");
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> sohbetleriGetir(
    int kullaniciID,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/sohbetlerigetir/$kullaniciID'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.cast<Map<String, dynamic>>();
      } else {
        print("API Hatası: ${response.statusCode} - ${response.body}");
        return [];
      }
    } catch (e) {
      print("İstek sırasında hata oluştu: $e");
      return [];
    }
  }

  static Future<int?> mesajEkle({
    required int sohbetID,
    required int gonderenID,
    required String mesajMetni,
    required int aliciID,
  }) async {
    final url = Uri.parse("$baseUrl/mesajekle");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "sohbetID": sohbetID,
          "gonderenID": gonderenID,
          "mesajMetni": mesajMetni,
          "aliciID": aliciID,
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return jsonData["mesajID"];
      } else {
        print("Hata oluştu: ${response.body}");
        return null;
      }
    } catch (e) {
      print("İstisna oluştu: $e");
      return null;
    }
  }

  static Future<Map<String, dynamic>?> mesajGetir(int mesajID) async {
    final url = Uri.parse("$baseUrl/mesajigetir/$mesajID");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        print("Hata: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Hata oluştu: $e");
      return null;
    }
  }
}
