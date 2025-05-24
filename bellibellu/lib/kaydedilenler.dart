import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/seridlerprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Kaydedilenler extends StatefulWidget {
  const Kaydedilenler({super.key});

  @override
  State<Kaydedilenler> createState() => _KaydedilenlerState();
}

class _KaydedilenlerState extends State<Kaydedilenler> {
  late Future<void> _ilkYukleme;
  late int currentPage = 1;
  final ScrollController _scrollController = ScrollController();
  late List<Ozelurunkarti> urunkartlari = [];
  bool urunlistesisonumu = false;
  Future<void> kartlariolustur(List<Map<String, dynamic>> yeniurunler) async {
    for (Map<String, dynamic> urun in yeniurunler) {
      Ozelurunkarti kart = Ozelurunkarti(urun: urun);

      urunkartlari.add(kart);
    }
    setState(() {
      urunkartlari;
    });
  }

  @override
  void initState() {
    _ilkYukleme = getMoreUrunler();
    super.initState();
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
  }

  Future<void> getMoreUrunler() async {
    final newItems = await Urunlervt.getMoreKaydedilenUrun(
      currentPage,
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
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      body: Stack(
        children: [
          FutureBuilder(
            future: _ilkYukleme,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Renkler.kahverengi),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Bir hata oluştu: ${snapshot.error}"),
                );
              } else if (!snapshot.hasData) {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: urunkartlari.length,
                  itemBuilder: (context, index) {
                    return urunkartlari[index];
                  },
                );
              } else {
                return Center(
                  child: Text(
                    S.of(context).begenilen_urun_listesi_bos,
                    style: TextStyle(
                      color: Renkler.kahverengi,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
            },
          ),
          Positioned(
            bottom: 10,
            right: 20,

            child: SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  urunkartlari.clear();
                  getMoreUrunler();
                },

                child: Center(
                  child: Icon(
                    Icons.refresh,
                    size: 20,
                    color: Renkler.kahverengi,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Renkler.krem,
                  padding: EdgeInsets.zero, // Varsayılan padding'i kaldır),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
