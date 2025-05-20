import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sorularsayfasi extends StatefulWidget {
  const Sorularsayfasi({super.key});

  @override
  State<Sorularsayfasi> createState() => _SorularsayfasiState();
}

class _SorularsayfasiState extends State<Sorularsayfasi> {
  final List<Map<String, String>> soruCevaplar = [
    {
      "musteri": "A*** K***",
      "tarih": "10 Şubat 2020 | 23:29",
      "soru": "Merhaba, ürünün çeliği paslanmaz değil mi?",
      "cevap": "Evet efendim, paslanmaz çelikten üretilmiştir.",
    },
    {
      "musteri": "M*** D***",
      "tarih": "12 Mart 2021 | 14:45",
      "soru": "Bu ürün suya dayanıklı mı?",
      "cevap":
          "Evet, suya dayanıklıdır ancak uzun süre su altında tutmamanız önerilir.",
    },
    {
      "musteri": "Z*** Y***",
      "tarih": "5 Nisan 2022 | 09:30",
      "soru": "İndirim yapılıyor mu?",
      "cevap": "Şu an için özel bir indirim bulunmamaktadır.",
    },
    {
      "musteri": "A*** Ç***",
      "tarih": "23 Mayıs 2023 | 19:15",
      "soru": "Hangi kargo firması ile gönderiyorsunuz?",
      "cevap": "Aras Kargo ve Yurtiçi Kargo ile gönderim yapıyoruz.",
    },
    {
      "musteri": "F*** K***",
      "tarih": "8 Haziran 2022 | 11:10",
      "soru": "Ürün orijinal mi?",
      "cevap": "Evet, ürün %100 orijinal ve üretici garantilidir.",
    },
    {
      "musteri": "E*** Ş***",
      "tarih": "2 Temmuz 2021 | 16:00",
      "soru": "Bu ürün hangi malzemeden üretilmiştir?",
      "cevap": "Ürün paslanmaz çelikten üretilmiştir.",
    },
    {
      "musteri": "C*** E***",
      "tarih": "15 Ağustos 2020 | 21:40",
      "soru": "Fiyatına kargo dahil mi?",
      "cevap": "Hayır, kargo ücreti fiyatımıza dahil değildir.",
    },
    {
      "musteri": "D*** T***",
      "tarih": "3 Eylül 2019 | 07:20",
      "soru": "Ürünün küçük boyutu var mı?",
      "cevap": "Evet, küçük boyutlu seçeneklerimiz de mevcuttur.",
    },
    {
      "musteri": "H*** A***",
      "tarih": "20 Ekim 2022 | 13:05",
      "soru": "Bu modelin farklı renkleri var mı?",
      "cevap":
          "Evet, bu modelin kırmızı, mavi ve siyah renkleri bulunmaktadır.",
    },
    {
      "musteri": "M*** G***",
      "tarih": "18 Kasım 2021 | 18:50",
      "soru": "Ürünün garantisi var mı?",
      "cevap": "Evet, ürün 2 yıl garantilidir.",
    },
    {
      "musteri": "A*** C***",
      "tarih": "1 Ocak 2020 | 12:00",
      "soru": "Bu ürün kaç günde teslim edilir?",
      "cevap": "3 iş günü içinde teslim edilir.",
    },
    {
      "musteri": "H*** E***",
      "tarih": "7 Şubat 2023 | 17:25",
      "soru": "Ürünün içeriği sağlığa zararlı mı?",
      "cevap": "Hayır, tamamen doğal ve sağlığa zararsızdır.",
    },
    {
      "musteri": "Y*** Ç***",
      "tarih": "25 Nisan 2021 | 08:30",
      "soru": "Ürün rengi soluyor mu?",
      "cevap": "Hayır, ürün uzun süre renk korumasına sahiptir.",
    },
    {
      "musteri": "C*** A***",
      "tarih": "13 Temmuz 2022 | 15:10",
      "soru": "Kırık ürün çıkarsa iade alıyor musunuz?",
      "cevap": "Evet, kırık veya hasarlı ürünlerde ücretsiz değişim yapıyoruz.",
    },
    {
      "musteri": "K*** B***",
      "tarih": "30 Kasım 2020 | 10:45",
      "soru": "Bu ürünü hediye paketi yapabilir misiniz?",
      "cevap": "Evet, sipariş sırasında hediye paketi seçeneği mevcuttur.",
    },
    {
      "musteri": "E*** Y***",
      "tarih": "5 Mart 2019 | 09:00",
      "soru": "Ürün kutulu mu geliyor?",
      "cevap": "Evet, orijinal kutusunda gönderilmektedir.",
    },
    {
      "musteri": "S*** A***",
      "tarih": "12 Nisan 2021 | 18:20",
      "soru": "Ürünün ölçüleri nedir?",
      "cevap": "Ürün açıklamalarında detaylı ölçü bilgisi mevcuttur.",
    },
    {
      "musteri": "B*** A***",
      "tarih": "18 Haziran 2022 | 20:15",
      "soru": "Kırılır mı?",
      "cevap": "Ürün dayanıklıdır, ancak düşmelere karşı dikkatli olunmalıdır.",
    },
    {
      "musteri": "G*** T***",
      "tarih": "27 Eylül 2021 | 14:10",
      "soru": "Montaj gerektiriyor mu?",
      "cevap": "Hayır, montaj gerektirmeyen bir üründür.",
    },
    {
      "musteri": "S*** D***",
      "tarih": "6 Kasım 2023 | 10:40",
      "soru": "Geri iade süresi kaç gün?",
      "cevap": "14 gün içinde iade hakkınız bulunmaktadır.",
    },
    {
      "musteri": "A*** A***",
      "tarih": "21 Aralık 2019 | 08:30",
      "soru": "Ürünün parçaları eksik geldi, ne yapmalıyım?",
      "cevap": "Müşteri hizmetlerimizle iletişime geçebilirsiniz.",
    },
    {
      "musteri": "E*** K***",
      "tarih": "10 Ocak 2022 | 16:50",
      "soru": "Ürün ses çıkarıyor mu?",
      "cevap": "Hayır, sessiz çalışan bir üründür.",
    },
    {
      "musteri": "N*** K***",
      "tarih": "29 Mayıs 2020 | 22:10",
      "soru": "Kargo ücreti ne kadar?",
      "cevap": "Kargo ücreti sipariş tutarına göre değişmektedir.",
    },
    {
      "musteri": "B*** Y***",
      "tarih": "14 Temmuz 2021 | 13:25",
      "soru": "Ürünün iç malzemesi nedir?",
      "cevap": "Ürün plastik ve metal karışımıdır.",
    },
    {
      "musteri": "S*** K***",
      "tarih": "9 Eylül 2022 | 19:05",
      "soru": "Bu ürün çocuklar için uygun mu?",
      "cevap": "Evet, 3 yaş ve üzeri çocuklar için uygundur.",
    },
    {
      "musteri": "V*** U***",
      "tarih": "22 Kasım 2023 | 11:40",
      "soru": "Şarjlı mı çalışıyor?",
      "cevap": "Evet, USB şarj ile çalışmaktadır.",
    },
    {
      "musteri": "G*** E***",
      "tarih": "3 Ocak 2024 | 20:15",
      "soru": "Ürün hafif mi?",
      "cevap": "Evet, oldukça hafif ve taşınabilir bir üründür.",
    },
    {
      "musteri": "M*** C***",
      "tarih": "15 Şubat 2021 | 14:50",
      "soru": "Kargo süresi kaç gün?",
      "cevap": "Yoğunluğa göre 3-5 iş günü sürebilmektedir.",
    },
  ];
  String seciliSiralama = "Önerilen Sıralama";

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
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Renkler.kuyubeyaz,
          appBar: AppBar(
            surfaceTintColor: Renkler.kuyubeyaz,
            backgroundColor: Renkler.kuyubeyaz,
            title: Text(
              S.of(context).sik_sorulanlar,
              style: TextStyle(
                color: Renkler.kahverengi,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                      S.of(context).soru_cevap('34'),
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
                  itemCount: soruCevaplar.length,
                  itemBuilder: (context, index) {
                    final s = soruCevaplar[index];
                    return Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(color: Renkler.kuyubeyaz),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  s['musteri']!,
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  s['tarih']!,
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                s['soru']!,
                                style: TextStyle(
                                  color: Renkler.kahverengi,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2 - 50,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 239, 226, 204),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 0.6,
                                  color: Renkler.kahverengi,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Ali HIMEYDA',
                                        style: TextStyle(
                                          color: Renkler.kahverengi,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      s['cevap']!,
                                      style: TextStyle(
                                        color: Renkler.kahverengi,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(color: Renkler.kahverengi),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: altButonlar(context),
        ),
         Provider.of<Loadingprovider>(context,listen: false).isloading?
        Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(
              color: const Color.fromARGB(83, 138, 103, 32),
            ),
            child: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(color: Renkler.kahverengi),
              ),
            ),
          ),
        ):SizedBox()
      ],
    );
  }

  void _telefonPopup(BuildContext context) {
    final TextEditingController _telefonController = TextEditingController();
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Renkler.kahverengi,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                S.of(context).soru_sor,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _telefonController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: S.of(context).soru_sor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi, // Buton rengi
                  ),
                  onPressed: () async {},
                  child: Text(
                    S.of(context).gonder,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
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
                _telefonPopup(context);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Renkler.kahverengi),
                foregroundColor: Renkler.kahverengi,
              ),
              child: Text(S.of(context).soru_sor),
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
