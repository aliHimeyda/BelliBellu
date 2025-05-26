import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/siparislerprovider.dart';
import 'package:bellibellu/services/siparislervt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class SepetSayfasi extends StatefulWidget {
  const SepetSayfasi({super.key});

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  late Future<void> siparislerigetir;
  @override
  void initState() {
    siparislerigetir = siparisleriYukle();
    super.initState();
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

  double get toplamFiyat {
    double toplam = 0.0;
    Provider.of<Siparislerprovider>(context, listen: false).siparisler.forEach((
      satici,
      urunler,
    ) {
      for (var urun in urunler) {
        if (urun['secili'] == true) {
          toplam += urun['fiyat'] * urun['urunSayisi'];
        }
      }
    });
    return toplam;
  }

  double get kargoUcreti {
    double toplam = 0.0;
    Provider.of<Siparislerprovider>(context, listen: false).siparisler.forEach((
      satici,
      urunler,
    ) {
      for (var urun in urunler) {
        if (urun['secili'] == true) {
          toplam += urun['kargoUcreti'];
        }
      }
    });
    return toplam;
  }

  void toggleSatici(String satici, bool? value) {
    setState(() {
      for (var urun
          in Provider.of<Siparislerprovider>(
            context,
            listen: false,
          ).siparisler[satici]!) {
        urun['secili'] = value;
      }
    });
  }

  bool tumUrunlerSecili(String satici) {
    return Provider.of<Siparislerprovider>(
      context,
      listen: false,
    ).siparisler[satici]!.every((urun) {
      urun['secili'] == true;
      seciliurunlerionayaekle();
      return urun['secili'] == true;
    });
  }

  void toggleUrun(String satici, int index, bool? value) {
    setState(() {
      Provider.of<Siparislerprovider>(
            context,
            listen: false,
          ).siparisler[satici]![index]['secili'] =
          value;
    });
    seciliurunlerionayaekle();
  }

  void seciliurunlerionayaekle() {
    Provider.of<Siparislerprovider>(
      context,
      listen: false,
    ).onaylanmisSiparisler.clear();
    Provider.of<Siparislerprovider>(context, listen: false).siparisler.forEach((
      satici,
      urun,
    ) {
      for (Map<String, dynamic> u in urun) {
        if (u['secili']) {
          Provider.of<Siparislerprovider>(
            context,
            listen: false,
          ).onaylanmisSiparisler.add(u);
          debugPrint(
            "dizi boyutu (onaylanmis olanlar) :${Provider.of<Siparislerprovider>(context, listen: false).onaylanmisSiparisler.length.toString()}_______________",
          );
        }
      }
    });
  }

  void detayGoster() {
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).sepet_detayi,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Renkler.kahverengi,
                ),
              ),
              const SizedBox(height: 12),
              ...Provider.of<Siparislerprovider>(
                context,
                listen: false,
              ).siparisler.entries.expand(
                (entry) => entry.value.where((urun) => urun['secili']).map((
                  urun,
                ) {
                  return ListTile(
                    leading: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            urun['urunResmi'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Renkler.kahverengi,
                          child: Text(
                            "x${urun['urunSayisi']}",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(urun['urunAdi']),
                    trailing: Text("${urun['fiyat'].toStringAsFixed(2)} TL"),
                  );
                }),
              ),
              const Divider(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).toplam,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Renkler.kahverengi,
                        ),
                      ),
                      Text(
                        "${toplamFiyat.toStringAsFixed(2)} TL",
                        style: TextStyle(color: Renkler.kahverengi),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).kargo_ucreti,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Renkler.kahverengi,
                        ),
                      ),
                      Text(
                        "${kargoUcreti.toStringAsFixed(2)} TL",
                        style: TextStyle(color: Renkler.kahverengi),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: siparislerigetir,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Renkler.kahverengi),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
        }
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Renkler.kahverengi,
                title: Text(
                  S
                      .of(context)
                      .sepetim_baslik(
                        context
                            .watch<Siparislerprovider>()
                            .siparisler
                            .values
                            .fold<int>(
                              0,
                              (sum, urunler) => sum + urunler.length,
                            )
                            .toString(),
                      ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              body: ListView.builder(
                itemCount:
                    context
                        .watch<Siparislerprovider>()
                        .siparisler
                        .entries
                        .toList()
                        .length,
                itemBuilder: (context, index) {
                  final entry =
                      context
                          .watch<Siparislerprovider>()
                          .siparisler
                          .entries
                          .toList()[index];
                  final String satici = entry.key;
                  final List<Map<String, dynamic>> urunler = entry.value;

                  return Card(
                    color: const Color.fromARGB(255, 250, 241, 226),
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CheckboxListTile(
                          value: tumUrunlerSecili(satici),
                          activeColor: Renkler.kahverengi,
                          onChanged: (val) => toggleSatici(satici, val),
                          title: Text(
                            satici,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        ...urunler.asMap().entries.map((entry) {
                          final int urunIndex = entry.key;
                          final Map<String, dynamic> urun = entry.value;
                          return Column(
                            children: [
                              Divider(color: Renkler.kahverengi),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Checkbox(
                                      activeColor: Renkler.kahverengi,
                                      value: urun['secili'],
                                      onChanged:
                                          (val) => toggleUrun(
                                            satici,
                                            urunIndex,
                                            val,
                                          ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 120,
                                      child: Image.network(
                                        urun['urunResmi'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            urun['urunAdi'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Renkler.kahverengi
                                                    .withOpacity(0.4),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    size: 16,
                                                    color: Renkler.kahverengi,
                                                  ),
                                                  onPressed: () async {
                                                    int? yeniadet =
                                                        await siparisSil(
                                                          urun['urunID'],
                                                        );
                                                    if (yeniadet != null) {
                                                      setState(() {
                                                        urun['urunSayisi'] =
                                                            yeniadet;
                                                      });
                                                    }
                                                  },
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4,
                                                      ),
                                                  decoration: BoxDecoration(
                                                    color: Renkler.kahverengi
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    urun['urunSayisi']
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Renkler.kahverengi,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.add,
                                                    size: 16,
                                                    color: Renkler.kahverengi,
                                                  ),
                                                  onPressed: () async {
                                                    int? yeniadet =
                                                        await siparisEkle(
                                                          urun['urunID'],
                                                        );
                                                    if (yeniadet != null) {
                                                      setState(() {
                                                        urun['urunSayisi'] =
                                                            yeniadet;
                                                      });
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text("Fiyat: ${urun['fiyat']} TL"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  );
                },
              ),
              bottomNavigationBar:
                  (context
                              .watch<Siparislerprovider>()
                              .siparisler
                              .entries
                              .toList()
                              .length >
                          0)
                      ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        color: Renkler.krem,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: detayGoster,
                              child: Row(
                                children: [
                                  Text(
                                    S.of(context).toplam,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_up,
                                    color: Renkler.kahverengi,
                                  ),
                                  Text(
                                    " ${(kargoUcreti + toplamFiyat).toStringAsFixed(2)} TL",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Renkler.kahverengi,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () async {
                                if (Provider.of<Siparislerprovider>(
                                  context,
                                  listen: false,
                                ).onaylanmisSiparisler.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Renkler.kahverengi,
                                      content: Text(
                                        S.of(context).lutfenSepettenUrunSecin,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                } else {
                                  kartPopupGoster(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Renkler.kahverengi,
                              ),
                              child: Text(
                                S.of(context).sepeti_onayla,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                      : SizedBox(),
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
                        child: CircularProgressIndicator(
                          color: Renkler.kahverengi,
                        ),
                      ),
                    ),
                  ),
                )
                : SizedBox(),
          ],
        );
      },
    );
  }

  Future<bool> onaylanmisurunleriOnayla() async {
    return true;
  }

  Future<int?> siparisEkle(int urunID) async {
    final result = await Siparislervt.siparisEkle(
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
      urunID,
    );
    if (result != null) {
      int urunSayisi = result;
      print("Güncellenmiş urunSayisi: $urunSayisi");
      return urunSayisi;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'islem hatasi',
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
      return null;
    }
  }

  Future<int?> siparisSil(int urunID) async {
    final result = await Siparislervt.siparistenUrunSil(
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
      urunID,
    );
    if (result != null) {
      int urunSayisi = result;
      print("Güncellenmiş urunSayisi: $urunSayisi");
      return urunSayisi;
    } else {
      final siparisProvider = Provider.of<Siparislerprovider>(
        context,
        listen: false,
      );

      // 🔁 Map'in bir kopyası üzerinden gezin
      Map<String, List<Map<String, dynamic>>> kopya = Map.from(
        siparisProvider.siparisler,
      );

      kopya.forEach((satici, urunler) {
        urunler.removeWhere(
          (urun) => urun['urunSayisi'] == 1 && urun['urunID'] == urunID,
        );

        siparisProvider.siparisleriGuncelle();

        if (urunler.isEmpty) {
          siparisProvider.siparisler.remove(
            satici,
          ); // 🔥 Orijinal map'e müdahale
          siparisProvider.siparisleriGuncelle();
        }
      });

      debugPrint('islem hatasi : ');
      return null;
    }
  }

  void kartPopupGoster(BuildContext context) {
    final TextEditingController kartController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: Renkler.kuyubeyaz,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).kartBilgisiGir,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Renkler.kahverengi,
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: kartController,
                keyboardType: TextInputType.number,
                maxLength: 16,
                decoration: InputDecoration(
                  labelText: S.of(context).kartNumarasi,
                  labelStyle: TextStyle(color: Renkler.kahverengi),
                  border: OutlineInputBorder(),
                  fillColor: Renkler.kahverengi,
                  focusColor: Renkler.kahverengi,
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  if (kartController.text.length < 16) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Renkler.kahverengi,
                        content: Text(
                          S.of(context).gecersizKartUyarisi,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    return;
                  } else {
                    List<bool> basari = [];
                    for (Map<String, dynamic> siparis
                        in Provider.of<Siparislerprovider>(
                          context,
                          listen: false,
                        ).onaylanmisSiparisler) {
                      bool b = await Siparislervt.siparisiOnayla(
                        siparisID: siparis['siparisID'],
                        saticiID: siparis['SaticiID'],
                        kullaniciID:
                            Provider.of<Kullanicilarprovider>(
                              context,
                              listen: false,
                            ).currentkullanici['kullaniciID'],
                        kartnumarasi: kartController.text,
                      );
                      if (b) {
                        basari.add(b);
                      }
                    }

                    if (basari.isEmpty || basari.length == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Renkler.kahverengi,
                          content: Text(
                            S.of(context).hataOlustu,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      Provider.of<Siparislerprovider>(
                        context,
                        listen: false,
                      ).urunleriTemizle();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Renkler.kahverengi,
                          content: Text(
                            S.of(context).islem_basarili,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Renkler.krem),
                ),
                child: Text(
                  S.of(context).gonder,
                  style: TextStyle(color: Renkler.kahverengi),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
