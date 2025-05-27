import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Urunlerim extends StatefulWidget {
  const Urunlerim({super.key});

  @override
  State<Urunlerim> createState() => _UrunlerimState();
}

class _UrunlerimState extends State<Urunlerim> {
  late Future<void> urunlerimigetir;
  late int currentPage = 1;
  late List<String> secilimateryalOgeler = [];
  late List<String> seciliortamOgeler = [];
  late List<String> seciliturOgeler = [];
  late List<String> secilirenkOgeler = [];
  late List<Map<String, int>> secilifiyatOgeler = [];
  late String urunAdi = '';
  late String siralamaolcutu = '';
  late String tarihegore = '';
  bool urunlistesisonumu = false;
  Future<void> kartlariolustur(List<Map<String, dynamic>> yeniurunler) async {
    for (Map<String, dynamic> urun in yeniurunler) {
      Ozelurunkarti kart = Ozelurunkarti(urun: urun);

      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).saticiurunleri.add(kart);
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).degisikliklerikaydet();
    }
  }

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    urunlerimigetir = getMoreUrunler();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels -
              _scrollController.position.maxScrollExtent <=
          200) {
        if (!urunlistesisonumu) {
          currentPage++;
          getMoreUrunler();
        }
      }
    });
    super.initState();
  }

  Future<void> getMoreUrunler() async {
    final newItems = await Urunlervt.getMoreUrunlerim(
      currentPage,
      secilimateryalOgeler,
      seciliortamOgeler,
      seciliturOgeler,
      secilifiyatOgeler,
      siralamaolcutu,
      urunAdi,
      tarihegore,
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
    );
    if (newItems.length < 15) {
      urunlistesisonumu = true;
    }
    kartlariolustur(newItems);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: urunlerimigetir,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Renkler.kahverengi),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
            }
            if (context.watch<Kullanicilarprovider>().saticiurunleri.length >
                0) {
              return Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: ListView.builder(
                    itemCount:
                        context
                            .watch<Kullanicilarprovider>()
                            .saticiurunleri
                            .length,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      debugPrint(
                        '$index from ${context.watch<Kullanicilarprovider>().saticiurunleri.length}',
                      );
                      return Center(
                        child: Column(
                          children: [
                            context
                                .watch<Kullanicilarprovider>()
                                .saticiurunleri[index],
                            SizedBox(height: 7),
                            if (Provider.of<Loadingprovider>(
                              context,
                              listen: false,
                            ).isloading)
                              CircularProgressIndicator(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Renkler.krem,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset(
                            'assets/emptybox.png',
                            color: Renkler.kahverengi,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          S.of(context).yayinlananUrunYok,
                          style: TextStyle(
                            fontSize: 16,
                            color: Renkler.kahverengi,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            child: FloatingActionButton(
              onPressed: () {
                context.push(Paths.urunekleme);
              },
              backgroundColor: Renkler.krem,
              child: Icon(Icons.add, color: Renkler.kahverengi),
            ),
          ),
        ),
        
      ],
    );
  }
}
