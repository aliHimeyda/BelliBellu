import 'package:bellibellu/ceviri.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/sorularprovider.dart';
import 'package:bellibellu/services/yorumlarprovider.dart';
import 'package:bellibellu/services/yorumlarvt.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class YorumlarSayfasi extends StatefulWidget {
  final int urunID;
  const YorumlarSayfasi({super.key, required this.urunID});

  @override
  State<YorumlarSayfasi> createState() => _YorumlarSayfasiState();
}

class _YorumlarSayfasiState extends State<YorumlarSayfasi> {
  final ScrollController _scrollController = ScrollController();
  late String seciliSiralama = '';
  late bool yorumlarlistesisonumu = false;

  String gizliAdSoyad(String ad, String soyad) {
    String gizliAd = ad.isNotEmpty ? '${ad[0]}******' : '';
    String gizliSoyad = soyad.isNotEmpty ? '${soyad[0]}******' : '';
    return '$gizliAd $gizliSoyad';
  }

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
                      Provider.of<Yorumlarprovider>(context, listen: false)
                          .currentPage = 1;
                      Provider.of<Yorumlarprovider>(
                        context,
                        listen: false,
                      ).yorumlar.clear();

                      getmoreyorumlar();
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
  void initState() {
    Future.delayed(Duration.zero, () {
      seciliSiralama = S.of(context).onerilen_siralama;
      Provider.of<Yorumlarprovider>(context, listen: false).yorumlar.length < 15
          ? yorumlarlistesisonumu = true
          : false;
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels -
              _scrollController.position.maxScrollExtent <=
          200) {
        if (!yorumlarlistesisonumu) {
          context.watch<Yorumlarprovider>().currentPage++;
          getmoreyorumlar();
        }
      }
    });
    super.initState();
  }

  Future<void> getmoreyorumlar() async {
    final newItems = await Yorumlarvt.yorumlariGetir(
      urunID: widget.urunID,
      page: Provider.of<Sorularprovider>(context, listen: false).currentPage,
      siralamaOlcutu: Cevirici.siralamacevir(context, seciliSiralama),
    );
    if (newItems.length < 15) {
      yorumlarlistesisonumu = true;
    }
    Provider.of<Yorumlarprovider>(
      context,
      listen: false,
    ).yorumlar.addAll(newItems);
    Provider.of<Yorumlarprovider>(context, listen: false).guncelle();
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
              S.of(context).baslikDegerlendirme,
              style: TextStyle(
                color: Renkler.kahverengi,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  begenilenekaydet(
                    widget.urunID,
                    Provider.of<Kullanicilarprovider>(
                      context,
                      listen: false,
                    ).currentkullanici['kullaniciID'],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        S.of(context).enCokBegenilenler,
                        style: TextStyle(color: Renkler.kahverengi),
                      ),
                      duration: Duration(seconds: 2),
                      backgroundColor: Renkler.krem,
                    ),
                  );
                },
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
                      S
                          .of(context)
                          .puanYorumMetni(
                            context.watch<Yorumlarprovider>().yorumlar.length,
                            context.watch<Yorumlarprovider>().yorumlar.length,
                          ),
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
                  itemCount: context.watch<Yorumlarprovider>().yorumlar.length,
                  itemBuilder: (context, index) {
                    final y = context.watch<Yorumlarprovider>().yorumlar[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                            "${gizliAdSoyad(y['musteriAdi'], y['musteriSoyadi'])}| ${DateFormat('dd.MM.yyyy').format(DateTime.parse(y['yorumTarihi']))}",
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(y["yorumMetni"] ?? ""),

                              const SizedBox(height: 8),
                              Text(
                                "${S.of(context).satici_bilgisi('${y['saticiAdi']} ${y['saticiSoyadi']}')}",
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
        ),
        Provider.of<Loadingprovider>(context, listen: false).isloading
            ? Center(
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
            )
            : SizedBox(),
      ],
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
              child: Text(
                S
                    .of(context)
                    .soru_cevap(
                      context.watch<Sorularprovider>().soru_cevaplar.length,
                    ),
              ),
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
