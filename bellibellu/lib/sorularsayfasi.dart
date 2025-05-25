import 'package:bellibellu/ceviri.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/siparislerprovider.dart';
import 'package:bellibellu/services/siparislervt.dart';
import 'package:bellibellu/services/sorularprovider.dart';
import 'package:bellibellu/services/sorularvt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Sorularsayfasi extends StatefulWidget {
  final int urunID;
  const Sorularsayfasi({super.key, required this.urunID});

  @override
  State<Sorularsayfasi> createState() => _SorularsayfasiState();
}

class _SorularsayfasiState extends State<Sorularsayfasi> {
  final ScrollController _scrollController = ScrollController();
  late Future<void> sorularigetir;
  late String seciliSiralama = '';
  late bool sorularlistesisonumu = false;

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
                      Provider.of<Sorularprovider>(context, listen: false)
                          .currentPage = 1;
                      Provider.of<Sorularprovider>(
                        context,
                        listen: false,
                      ).soru_cevaplar.clear();

                      getmoresorular();
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
      Provider.of<Sorularprovider>(
                context,
                listen: false,
              ).soru_cevaplar.length <
              15
          ? sorularlistesisonumu = true
          : false;
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels -
              _scrollController.position.maxScrollExtent <=
          200) {
        if (!sorularlistesisonumu) {
          context.watch<Sorularprovider>().currentPage++;
          getmoresorular();
        }
      }
    });
    super.initState();
  }

  Future<void> getmoresorular() async {
    final newItems = await Sorularvt.sorulariGetir(
      urunID: widget.urunID,
      page: Provider.of<Sorularprovider>(context, listen: false).currentPage,
      siralamaOlcutu: Cevirici.siralamacevir(context, seciliSiralama),
    );
    if (newItems.length < 15) {
      sorularlistesisonumu = true;
    }
    Provider.of<Sorularprovider>(
      context,
      listen: false,
    ).soru_cevaplar.addAll(newItems);
    Provider.of<Sorularprovider>(context, listen: false).guncelle();
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
                      S
                          .of(context)
                          .soru_cevap(
                            context
                                .watch<Sorularprovider>()
                                .soru_cevaplar
                                .length,
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
                  controller: _scrollController,
                  itemCount:
                      context.watch<Sorularprovider>().soru_cevaplar.length,
                  itemBuilder: (context, index) {
                    final s =
                        context.watch<Sorularprovider>().soru_cevaplar[index];
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
                                  '${s['musteriAdi']} ${s['musteriSoyadi']}',
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat(
                                    'dd.MM.yyyy',
                                  ).format(DateTime.parse(s['soruTarihi'])),
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
                                s['soruMetni'],
                                style: TextStyle(
                                  color: Renkler.kahverengi,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              width:
                                  MediaQuery.of(context).size.width / 1.2 - 50,
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
                                        '${s['saticiAdi']} ${s['saticiSoyadi']}',
                                        style: TextStyle(
                                          color: Renkler.kahverengi,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      s['cevapMetni'],
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
                keyboardType: TextInputType.text,
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
              onPressed: () async {
                await siparisEkle(widget.urunID);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).sepete_eklendi,
                      style: TextStyle(color: Renkler.kahverengi),
                    ),
                    duration: Duration(seconds: 2),
                    backgroundColor: Renkler.krem,
                  ),
                );
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

  Future<void> siparisEkle(int urunID) async {
    final yenieklenen = await Siparislervt.siparisEkle(
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
      urunID,
    );
    await siparisleriYukle();
    Provider.of<Siparislerprovider>(
      context,
      listen: false,
    ).siparisleriGuncelle();
  }

  Future<void> siparisleriYukle() async {
    Provider.of<Siparislerprovider>(
      context,
      listen: false,
    ).siparisler = await Siparislervt.tumSiparisleriGetir(
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
    );

    Provider.of<Siparislerprovider>(context, listen: false).siparisler.forEach((
      satici,
      urunler,
    ) {
      print('Satıcı: $satici');
      for (var urun in urunler) {
        if (urun['secili'] == 1) {
          urun['secili'] = true;
        } else {
          urun['secili'] = false;
        }
        print('  Ürün: ${urun['urunAdi']} - Fiyat: ${urun['toplamTutar']}');
      }
    });
  }
}
