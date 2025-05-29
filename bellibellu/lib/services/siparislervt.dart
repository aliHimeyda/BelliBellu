import 'dart:convert';

import 'package:http/http.dart' as http;

class Siparislervt {
  static const String baseUrl = 'https://d713-92-45-16-34.ngrok-free.app';

  static Future<int?> siparisEkle(int kullaniciID, int urunID) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/siparis_ekle'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'kullaniciID': kullaniciID, 'urunID': urunID}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('servisten gelen data urunsayisi : ${data['urunSayisi']}');

        return data['urunSayisi']; // sadece urunSayisi dönüyoruz
      } else {
        print("Hata: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Hata oluştu: $e");
      return null;
    }
  }

  static Future<int?> siparistenUrunSil(int kullaniciID, int urunID) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/siparis_sil'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'kullaniciID': kullaniciID, 'urunID': urunID}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('servisten gelen data urunsayisi : ${data['urunSayisi']}');
        return data['urunSayisi']; // sadece urunSayisi dönüyoruz
      } else {
        print("Hata: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print(" Hata oluştu: $e");
      return null;
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

  static Future<Map<String, List<Map<String, dynamic>>>>
  tumgecmisSiparisleriGetir(int kullaniciID) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/tum_gecmissiparisler/$kullaniciID'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = jsonDecode(response.body);

        final Map<String, List<Map<String, dynamic>>> groupedgecmisSiparisler =
            {};

        decodedJson.forEach((key, value) {
          // value burada List<dynamic> olacak, onu List<Map<String, dynamic>>'e cast ediyoruz
          groupedgecmisSiparisler[key] = List<Map<String, dynamic>>.from(value);
        });

        return groupedgecmisSiparisler;
      } else {
        print(" Hata: ${response.statusCode} - ${response.body}");
        return {};
      }
    } catch (e) {
      print(" İstek sırasında hata oluştu: $e");
      return {};
    }
  }

  static Future<List<Map<String, dynamic>>> faturadetayigetir(
    int faturaID,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/faturadetayigetir/$faturaID'),
      );

      if (response.statusCode == 200) {
        return (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      } else {
        print(" Hata: ${response.statusCode} - ${response.body}");
        return [];
      }
    } catch (e) {
      print(" İstek sırasında hata oluştu: $e");
      return [];
    }
  }

  static Future<bool> siparisiOnayla({
    required int siparisID,
    required int saticiID,
    required int kullaniciID,
    required String kartnumarasi,
  }) async {
    final url = Uri.parse("$baseUrl/siparisonayla");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "siparisID": siparisID,
          "saticiID": saticiID,
          "kullaniciID": kullaniciID,
          "kartnumarasi": kartnumarasi,
        }),
      );

      if (response.statusCode == 200) {
        print(" Sipariş onaylandı: ${response.body}");
        return true;
      } else {
        print(" Sunucu hatası: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(" Hata oluştu: $e");
      return false;
    }
  }
}
