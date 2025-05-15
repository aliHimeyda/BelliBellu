import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';

class YorumlarSayfasi extends StatefulWidget {
  const YorumlarSayfasi({super.key});

  @override
  State<YorumlarSayfasi> createState() => _YorumlarSayfasiState();
}

class _YorumlarSayfasiState extends State<YorumlarSayfasi> {
  String seciliSiralama = "Önerilen Sıralama";

  final List<Map<String, String>> yorumlar = [
    {
      "isim": "M** P**",
      "tarih": "22 Eylül 2024",
      "yorum":
          "Öncelikle çok güzel ve özenle paketlenmişti. kargo da zamanında geldi saat gayet güzel ve çok hoş duruyo kesinlikle tavsiye ediyorum:)",
      "boy": "165 cm",
      "kilo": "55 kg",
    },
    {
      "isim": "P** Ç** D**",
      "tarih": "14 Mayıs 2025",
      "yorum": "fiyat performans ürünü güzel",
      "boy": "175 cm",
      "kilo": "65 kg",
    },
    {
      "isim": "F** Ç**",
      "tarih": "13 Mayıs 2025",
      "yorum": "arkadaşıma hediye almıştım çok beğendi gayet başarılı bir ürün",
      "boy": "165 cm",
      "kilo": "55 kg",
    },
    {
      "isim": "***** *****",
      "tarih": "12 Mayıs 2025",
      "yorum": "fotoğraftaki gibi elime ulaştı",
    },
    {
      "isim": "f** c**",
      "tarih": "12 Mayıs 2025",
      "yorum": "güzel ürün teşekkürler",
      "boy": "170 cm",
      "kilo": "70 kg",
    },
  ];

  void siralamaPopupAc() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final siralamaSecenekleri = [
          S.of(context).onerilen_siralama,
          S.of(context).yeniden_eskiye,
          S.of(context).eskiden_yeniye,
        ];

        return Padding(
          padding: const EdgeInsets.only(bottom: 50.0, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                siralamaSecenekleri.map((secenek) {
                  return RadioListTile<String>(
                    activeColor: Renkler.kahverengi,
                    title: Text(secenek),
                    value: secenek,
                    groupValue: seciliSiralama,
                    onChanged: (value) {
                      setState(() {
                        seciliSiralama = value!;
                      });
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        surfaceTintColor: Renkler.kuyubeyaz,
        backgroundColor: Renkler.kuyubeyaz,
        title: Text(
          S.of(context).baslikDegerlendirme,
          style: TextStyle(
            color: Renkler.kahverengi,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.favorite_border, color: Renkler.kahverengi),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          // Üst Bilgi ve Sıralama Butonu
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  S.of(context).puanYorumMetni('12', '34'),
                  style: TextStyle(color: Renkler.kahverengi),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: siralamaPopupAc,
                  icon: const Icon(Icons.sort, color: Renkler.kahverengi),
                  label: Text(
                    seciliSiralama,
                    style: TextStyle(color: Renkler.kahverengi),
                  ),
                ),
              ],
            ),
          ),

          const Divider(color: Renkler.kahverengi),

          // Yorum Listesi
          Expanded(
            child: ListView.builder(
              itemCount: yorumlar.length,
              itemBuilder: (context, index) {
                final yorum = yorumlar[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: Text("${yorum["isim"]} | ${yorum["tarih"]}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(yorum["yorum"] ?? ""),
                          if (yorum["boy"] != null && yorum["kilo"] != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                "${yorum["boy"]} • ${yorum["kilo"]}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          const SizedBox(height: 8),
                          Text(
                            "${S.of(context).satici_bilgisi('satici')}",
                            style: const TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Renkler.kahverengi),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: altButonlar(context),
    );
  }

  Widget altButonlar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      color: Renkler.krem,
      child: Row(
        children: [
          // Soru & Cevap Butonu
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                // Soru & Cevap sayfasına git
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Renkler.kahverengi),
                foregroundColor: Renkler.kahverengi,
              ),
              child: Text(S.of(context).soru_cevap('34')),
            ),
          ),
          const SizedBox(width: 8),
          // Sepete Ekle Butonu
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Sepete ekle işlemi
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Renkler.kahverengi,
              ),

              child: Text(S.of(context).sepete_ekle),
            ),
          ),
        ],
      ),
    );
  }
}
