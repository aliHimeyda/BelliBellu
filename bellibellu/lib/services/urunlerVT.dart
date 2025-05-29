import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Urunlervt {
  static const String baseUrl = 'https://d713-92-45-16-34.ngrok-free.app';
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
    int kullaniciID,
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
        'kullaniciID': kullaniciID.toString(),
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

  static Future<List<Map<String, dynamic>>> getMoreUrunlerim(
    int page,
    List<String>? secilimateryalOgeler,
    List<String>? seciliortamOgeler,
    List<String>? seciliturOgeler,
    List<Map<String, int>>? secilifiyatOgeler,
    String? siralamaolcutu,
    String? arananurunAdi,
    String? tarihegore,
    int kullaniciID,
  ) async {
    final limit = 15;
    String materyalJson = jsonEncode(secilimateryalOgeler);
    String ortamJson = jsonEncode(seciliortamOgeler);
    String turJson = jsonEncode(seciliturOgeler);
    String fiyatJson = jsonEncode(secilifiyatOgeler);

    final uri = Uri.parse('$baseUrl/Urunlerim').replace(
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
        'kullaniciID': kullaniciID.toString(),
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

  static Future<List<Map<String, dynamic>>> getbelirliUrunlerim(
    int page,
    List<String>? secilimateryalOgeler,
    List<String>? seciliortamOgeler,
    List<String>? seciliturOgeler,
    List<Map<String, int>>? secilifiyatOgeler,
    String? siralamaolcutu,
    String? arananurunAdi,
    String? tarihegore,
    int kullaniciID,
  ) async {
    final limit = 15;
    String materyalJson = jsonEncode(secilimateryalOgeler);
    String ortamJson = jsonEncode(seciliortamOgeler);
    String turJson = jsonEncode(seciliturOgeler);
    String fiyatJson = jsonEncode(secilifiyatOgeler);

    final uri = Uri.parse('$baseUrl/Urunlerim').replace(
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
        'kullaniciID': kullaniciID.toString(),
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

  static Future<Map<String, dynamic>?> getSaticiFaaliyetBilgileri(
    int kullaniciID,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/saticifaaliyet/$kullaniciID'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        print("Sunucu Hatası: ${response.statusCode} - ${response.body}");
        return null;
      }
    } catch (e) {
      print("İstek sırasında hata oluştu: $e");
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> getMoreKaydedilenUrun(
    int page,
    int kullaniciID,
  ) async {
    final limit = 15;
    final uri = Uri.parse('$baseUrl/KaydedilenUrunler').replace(
      queryParameters: {
        'page': page.toString(),
        'limit': limit.toString(),
        'kullaniciID': kullaniciID.toString(),
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

  static Future<Map<String, dynamic>> getgezilmisUrunByAd(
    String urunAdi,
  ) async {
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

  static Future<Map<String, dynamic>> getUrunByAd(
    String urunAdi,
    String kullaniciID,
  ) async {
    debugPrint(urunAdi);
    final response = await http.get(
      Uri.parse('$baseUrl/urun/$urunAdi/$kullaniciID'),
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

  static Future<bool> urunu_kaydedilenlere_kaydet(
    int kullaniciID,
    int urunID,
  ) async {
    try {
      debugPrint(
        'eklenen: ' +
            urunID.toString() +
            '  musteri: ' +
            kullaniciID.toString(),
      );
      Map<String, int> yniVeri = {'kullaniciID': kullaniciID, 'urunID': urunID};
      // HTTP PUT isteği
      final response = await http.post(
        Uri.parse('$baseUrl/urunu_kaydedilenlere_kaydet'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(yniVeri),
      );

      if (response.statusCode == 201) {
        print('kaydedilen urunlere kayit islemi başarılı: ${response.body}');
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

  static Future<bool> urunu_kaydedilenlerden_sil(
    int kullaniciID,
    int urunID,
  ) async {
    try {
      debugPrint(
        'silinecek: ' +
            urunID.toString() +
            '  musteri: ' +
            kullaniciID.toString(),
      );
      final response = await http.delete(
        Uri.parse('$baseUrl/urunu_kaydedilenlerden_sil/$kullaniciID/$urunID'),
      );

      if (response.statusCode == 200) {
        print(
          'kaydedilen urunlerden kayit silme islemi başarılı: ${response.body}',
        );
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

  static Future<List<Map<String, dynamic>>> getMoretakim(
    int page,
    List<String>? secilimateryalOgeler,
    List<String>? seciliortamOgeler,
    List<String>? seciliturOgeler,
    List<Map<String, int>>? secilifiyatOgeler,
    String? siralamaolcutu,
    String? arananurunAdi,
    String? tarihegore,
    int kullaniciID,
  ) async {
    final limit = 15;
    String materyalJson = jsonEncode(secilimateryalOgeler);
    String ortamJson = jsonEncode(seciliortamOgeler);
    String turJson = jsonEncode(seciliturOgeler);
    String fiyatJson = jsonEncode(secilifiyatOgeler);

    final uri = Uri.parse('$baseUrl/takimlar').replace(
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
        'kullaniciID': kullaniciID.toString(),
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

 static Future<bool> urunEkle({
  required String urunAdi,
  required String urunResmi,
  required String urunrengi,
  required String materyali,
  required String suyadayaniklimi,
  required double fiyat,
  required String garantisuresi,
  required String ortam,
  required int stokdurumu,
  required double genislik,
  required double uzunluk,
  required double agirlik,
  required int kullaniciID,
  required bool sandalyemi,
}) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/urunekle'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "urunAdi": urunAdi,
        "urunResmi": urunResmi,
        "urunrengi": urunrengi,
        "materyali": materyali,
        "suyadayaniklimi": suyadayaniklimi,
        "fiyat": fiyat,
        "garantisuresi": garantisuresi,
        "ortam": ortam,
        "stokdurumu": stokdurumu,
        "genislik": genislik,
        "uzunluk": uzunluk,
        "agirlik": agirlik,
        "kullaniciID": kullaniciID,
        "sandalyemi": sandalyemi,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Sunucu hatası: ${response.body}");
      return false;
    }
  } catch (e) {
    print("İstek hatası: $e");
    return false;
  }
}

static Future<String?> resimYukleVeLinkAl() async {
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image == null) return null;

  final apiKey = "6c92a28a573e07438d5e0c35cea3da08"; 

  final bytes = await File(image.path).readAsBytes();
  final base64Image = base64Encode(bytes);

  final response = await http.post(
    Uri.parse("https://api.imgbb.com/1/upload?key=$apiKey"),
    body: {
      "image": base64Image,
      "name": "resim_${DateTime.now().millisecondsSinceEpoch}",
    },
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return json["data"]["url"];
  } else {
    print("Hata: ${response.body}");
    return null;
  }
}

}
