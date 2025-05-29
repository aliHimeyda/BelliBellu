import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/mesajlarprovider.dart';
import 'package:bellibellu/services/mesajlarvt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SaticiMesajlarimPage extends StatefulWidget {
  @override
  _SaticiMesajlarimPageState createState() => _SaticiMesajlarimPageState();
}

class _SaticiMesajlarimPageState extends State<SaticiMesajlarimPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool sohbetVar = true; // false yaparsan boş ekran gelir
  late Future<void> sohbetler;
  @override
  void initState() {
    sohbetler = sohbetlerigetir();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> sohbetlerigetir() async {
    final gelensohbetler = await Mesajlarvt.sohbetleriGetir(
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri
          ? Provider.of<Kullanicilarprovider>(
            context,
            listen: false,
          ).currentkullanici['musteriID']
          : Provider.of<Kullanicilarprovider>(
            context,
            listen: false,
          ).currentkullanici['saticiID'],
    );
    Provider.of<Mesajlarprovider>(
      context,
      listen: false,
    ).chatsohbetleri.clear();
    Provider.of<Mesajlarprovider>(
      context,
      listen: false,
    ).sorusohbetleri.clear();
    for (Map<String, dynamic> sohbet in gelensohbetler) {
      if (sohbet['soruID'] == null) {
        Provider.of<Mesajlarprovider>(
          context,
          listen: false,
        ).chatsohbetleri.add(sohbet);
        Provider.of<Mesajlarprovider>(context, listen: false).guncelle();
      } else {
        Provider.of<Mesajlarprovider>(
          context,
          listen: false,
        ).sorusohbetleri.add(sohbet);
        Provider.of<Mesajlarprovider>(context, listen: false).guncelle();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget chatsohbetleri = buildSohbetListesi();
    final Widget sorusohbetleri = buildsoruSohbetListesi();
    return FutureBuilder(
      future: sohbetler,
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
              backgroundColor: Renkler.kuyubeyaz,
              appBar: AppBar(
                title: Text(
                  Provider.of<Kullanicilarprovider>(
                        context,
                        listen: false,
                      ).ismusteri
                      ? S.of(context).satici_mesajlarim
                      : S.of(context).musteri_mesajlarim,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Renkler.krem,
                iconTheme: IconThemeData(color: Colors.black),
                bottom: TabBar(
                  dividerColor: Renkler.kahverengi,
                  indicatorColor: Renkler.kahverengi,
                  controller: _tabController,
                  labelColor: Renkler.kahverengi,
                  unselectedLabelColor: Renkler.kahverengi,
                  tabs: [
                    Tab(
                      text:
                          Provider.of<Kullanicilarprovider>(
                                context,
                                listen: false,
                              ).ismusteri
                              ? S.of(context).urun_sorularim
                              : S.of(context).urun_sorulari,
                    ),
                    Tab(
                      text:
                          Provider.of<Kullanicilarprovider>(
                                context,
                                listen: false,
                              ).ismusteri
                              ? S.of(context).siparis_sorularim
                              : S.of(context).siparis_sorulari,
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  sohbetVar ? sorusohbetleri : buildBosEkran(),
                  sohbetVar ? chatsohbetleri : buildBosEkran(),
                ],
              ),
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

  Widget buildBosEkran() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail_outline, size: 64, color: Renkler.kahverengi),
          SizedBox(height: 16),
          Text(S.of(context).urun_soru_yok, style: TextStyle(fontSize: 16)),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              S.of(context).alisverise_devam_et,
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Renkler.kahverengi,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSohbetListesi() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: context.watch<Mesajlarprovider>().chatsohbetleri.length,
        itemBuilder: (context, index) {
          return buildSohbetKart(
            alici:
                '${context.watch<Mesajlarprovider>().chatsohbetleri[index]['saticiadi']} ${context.watch<Mesajlarprovider>().chatsohbetleri[index]['saticisoyadi']}',
            aliciID:
                context
                    .watch<Mesajlarprovider>()
                    .sorusohbetleri[index]['saticiID'],
            tarih:
                "${DateFormat('dd.MM.yyyy').format(DateTime.parse(context.watch<Mesajlarprovider>().chatsohbetleri[index]['olusturulmaTarihi']))}",
            sohbetID:
                context
                    .watch<Mesajlarprovider>()
                    .chatsohbetleri[index]['sohbetID'],
          );
        },
      ),
    );
  }

  Widget buildsoruSohbetListesi() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: context.watch<Mesajlarprovider>().sorusohbetleri.length,
        itemBuilder: (context, index) {
          return buildSohbetKart(
            alici:
                Provider.of<Kullanicilarprovider>(
                      context,
                      listen: false,
                    ).ismusteri
                    ? '${context.watch<Mesajlarprovider>().sorusohbetleri[index]['saticiadi']} ${context.watch<Mesajlarprovider>().sorusohbetleri[index]['saticisoyadi']}'
                    : context
                        .watch<Mesajlarprovider>()
                        .sorusohbetleri[index]['musterimail'],
            aliciID:
                Provider.of<Kullanicilarprovider>(
                      context,
                      listen: false,
                    ).ismusteri
                    ? context
                        .watch<Mesajlarprovider>()
                        .sorusohbetleri[index]['saticiID']
                    : context
                        .watch<Mesajlarprovider>()
                        .sorusohbetleri[index]['musteriID'],
            tarih:
                "${DateFormat('dd.MM.yyyy').format(DateTime.parse(context.watch<Mesajlarprovider>().sorusohbetleri[index]['olusturulmaTarihi']))}",
            sohbetID:
                context
                    .watch<Mesajlarprovider>()
                    .sorusohbetleri[index]['sohbetID'],
          );
        },
      ),
    );
  }

  Widget buildSohbetKart({
    required String alici,
    required int aliciID,
    required String tarih,
    required int sohbetID,
  }) {
    Map<String, dynamic> gereksinim = {
      'sohbetID': sohbetID,
      'alici': alici,
      'aliciID': aliciID,
      'tarih': tarih,
    };
    return Card(
      color: Renkler.krem,
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.store, color: Renkler.kahverengi),
        title: Text(alici, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
        trailing: Text(tarih, style: TextStyle(fontSize: 12)),
        onTap: () {
          context.push(Paths.sohbeticerigisayfasi, extra: gereksinim);
        },
      ),
    );
  }
}
