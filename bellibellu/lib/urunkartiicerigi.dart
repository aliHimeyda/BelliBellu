import 'package:bellibellu/ceviri.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/seridlerprovider.dart';
import 'package:bellibellu/services/siparislerprovider.dart';
import 'package:bellibellu/services/siparislervt.dart';
import 'package:bellibellu/services/sorularprovider.dart';
import 'package:bellibellu/services/sorularvt.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:bellibellu/services/yorumlarprovider.dart';
import 'package:bellibellu/services/yorumlarvt.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grock/grock.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Urunkartiicerigi extends StatefulWidget {
  final String urunAdi;
  const Urunkartiicerigi({Key? key, required this.urunAdi}) : super(key: key);

  @override
  State<Urunkartiicerigi> createState() => _UrunkartiicerigiState();
}

String gizliAdSoyad(String ad, String soyad) {
  String gizliAd = ad.isNotEmpty ? '${ad[0]}******' : '';
  String gizliSoyad = soyad.isNotEmpty ? '${soyad[0]}******' : '';
  return '$gizliAd $gizliSoyad';
}

class _UrunkartiicerigiState extends State<Urunkartiicerigi>
    with AutomaticKeepAliveClientMixin {
  late Future<void> urunugetir;
  late Map<String, dynamic> urun;

  @override
  bool get wantKeepAlive => true;

  static bool get begenibilgisi => begenibilgisi;
  @override
  void initState() {
    urunugetir = Urunugetir(context);
    super.initState();
  }

  Future<void> Urunugetir(BuildContext context) async {
    urun = await Urunlervt.getUrunByAd(
      widget.urunAdi,
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'].toString(),
    );
    Provider.of<Sorularprovider>(
      context,
      listen: false,
    ).soru_cevaplar = await Sorularvt.sorulariGetir(urunID: urun['urunID']);
    Provider.of<Sorularprovider>(context, listen: false).guncelle();
    Provider.of<Yorumlarprovider>(
      context,
      listen: false,
    ).yorumlar = await Yorumlarvt.yorumlariGetir(urunID: urun['urunID']);
    Provider.of<Yorumlarprovider>(context, listen: false).guncelle();
  }

  late bool begenilmismi = urun['begenilmismi'] == 1 ? true : false;
  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();
    bool showBottomNavBar = currentPath == Paths.urundetaylari;
    int uzunluk = 100 + random.nextInt(201);
    int genislik = 50 + random.nextInt(151);
    super.build(context); // Bu satır önemli
    return FutureBuilder(
      future: urunugetir,
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
              backgroundColor: const Color.fromRGBO(245, 241, 241, 1),
              body: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ListView(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: 350,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                  child: Image.network(
                                    urun['urunResmi'],
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Container(
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 0,
                                        bottom: 5,
                                      ),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              urun['urunAdi'],
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            S
                                                .of(context)
                                                .urun_aciklamasi(
                                                  urun['urunAdi'],
                                                  Cevirici.malzemeCevir(
                                                    context,
                                                    urun['materyali'],
                                                  ),
                                                  Cevirici.turCevir(
                                                    context,
                                                    urun['tur'],
                                                  ),
                                                  Cevirici.ortamCevir(
                                                    context,
                                                    urun['ortam'],
                                                  ),
                                                  urun['uzunluk'],
                                                  urun['genislik'],
                                                ),
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 20),
                                KisacaOzellikler(context),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 30),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        S.of(context).sik_sorulanlar,
                                        style: TextStyle(
                                          color: Renkler.kahverengi,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      TextButton(
                                        onPressed: () {
                                          context.push(
                                            Paths.sorularsayfasi,
                                            extra: urun['urunID'],
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              Renkler.kahverengi, // Yazı rengi
                                        ),
                                        child: Text(
                                          S
                                              .of(context)
                                              .tumunuGorButonu(
                                                context
                                                    .watch<Sorularprovider>()
                                                    .soru_cevaplar
                                                    .length,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                sorucevaplar(context),
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),

                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    S.of(context).kategoriler,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),

                                katagorilerseridi(context),

                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    S.of(context).urun_ozellikleri,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                KisacaOzellikler(context),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Renkler.kahverengi,
                                      size: 6,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      S
                                          .of(context)
                                          .bu_urun_turkiyede_uretilmistir,
                                      style: TextStyle(
                                        color: Renkler.kahverengi,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Renkler.kahverengi,
                                      size: 6,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      S
                                          .of(context)
                                          .urunlerin_garanti_suresi(
                                            urun['garantiSuresi']
                                                .toString()
                                                .substring(0, 1),
                                          ),
                                      style: TextStyle(
                                        color: Renkler.kahverengi,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(width: 5),
                                Text(
                                  S
                                      .of(context)
                                      .urun_aciklamasi(
                                        urun['urunAdi'],
                                        urun['materyali'],
                                        urun['tur'],
                                        urun['ortam'],
                                        urun['uzunluk'],
                                        urun['genislik'],
                                      ),
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    debugPrint('tiklandi');
                                    popup();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        198,
                                        211,
                                        187,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          S.of(context).tum_ozellikler,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Başlık ve Puan
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            S.of(context).baslikDegerlendirme,
                                            style: TextStyle(
                                              color: Renkler.kahverengi,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          const Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              context.push(
                                                Paths.yorumlarsayfasi,
                                                extra: urun['urunID'],
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              foregroundColor:
                                                  Renkler
                                                      .kahverengi, // Yazı rengi
                                            ),
                                            child: Text(
                                              S
                                                  .of(context)
                                                  .tumunuGorButonu(
                                                    context
                                                        .watch<
                                                          Yorumlarprovider
                                                        >()
                                                        .yorumlar
                                                        .length,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Puan Göstergesi
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                      ),
                                      child: Text(
                                        S
                                            .of(context)
                                            .puanYorumMetni(
                                              context
                                                  .watch<Yorumlarprovider>()
                                                  .yorumlar
                                                  .length,
                                              context
                                                  .watch<Yorumlarprovider>()
                                                  .yorumlar
                                                  .length,
                                            ),
                                        style: TextStyle(
                                          color: Renkler.kahverengi,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    // Yorumlar - kaydırılabilir
                                    yorumlarseridi(context),
                                    const SizedBox(height: 12),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Renkler.kahverengi,
                                            width: 0.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                ozelkapakliserid(
                                  context,
                                  S.of(context).begenebilecegin,
                                ),
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),

                                Provider.of<Seridlerprovider>(
                                  context,
                                  listen: false,
                                ).seridler[0],
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                Provider.of<Seridlerprovider>(
                                  context,
                                  listen: false,
                                ).seridler[4],
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Renkler.kahverengi,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),

                                GestureDetector(
                                  onTap: () async {
                                    await urunlerigetir(
                                      '${Cevirici.malzemeCevir(context, urun['materyali'])}',
                                      context,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 5,
                                    height: 65,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Renkler.kuyubeyaz,
                                      border: Border.all(
                                        width: 0.5,
                                        color: Renkler.kahverengi,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          S
                                              .of(context)
                                              .daha_fazla_materyal(
                                                Cevirici.malzemeCevir(
                                                  context,
                                                  urun['materyali'],
                                                ),
                                              ),
                                          style: TextStyle(
                                            color: Renkler.kahverengi,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          size: 15,
                                          color: Renkler.kahverengi,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await urunlerigetir(
                                      '${Cevirici.ortamCevir(context, urun['ortam'])}',
                                      context,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 5,
                                    height: 65,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Renkler.kuyubeyaz,
                                      border: Border.all(
                                        width: 0.5,
                                        color: Renkler.kahverengi,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          S
                                              .of(context)
                                              .daha_fazla_materyal(
                                                Cevirici.ortamCevir(
                                                  context,
                                                  urun['ortam'],
                                                ),
                                              ),
                                          style: TextStyle(
                                            color: Renkler.kahverengi,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          size: 15,
                                          color: Renkler.kahverengi,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await urunlerigetir(
                                      '${Cevirici.turCevir(context, urun['tur'])}',
                                      context,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 5,
                                    height: 65,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Renkler.kuyubeyaz,
                                      border: Border.all(
                                        width: 0.5,
                                        color: Renkler.kahverengi,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          S
                                              .of(context)
                                              .daha_fazla_materyal(
                                                Cevirici.turCevir(
                                                  context,
                                                  urun['tur'],
                                                ),
                                              ),
                                          style: TextStyle(
                                            color: Renkler.kahverengi,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          size: 15,
                                          color: Renkler.kahverengi,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  favoriteIcon(),
                  showBottomNavBar ? bottomnavigation(context) : SizedBox(),
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

  Center ozelkapakliserid(BuildContext context, String vasif) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 5,
        height: 360,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 182, 205, 162),
          borderRadius: BorderRadius.circular(10),
        ),
        child:
            Provider.of<Seridlerprovider>(context, listen: false).seridler[2],
      ),
    );
  }

  SingleChildScrollView katagorilerseridi(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              spacing: 0,
              children: [
                GestureDetector(
                  onTap: () async {
                    debugPrint('tiklandi');
                    final routeName = GoRouterState.of(context).name;
                    debugPrint("Şu anki route: $routeName");
                    debugPrint(
                      'su anki route urisi : ${GoRouterState.of(context).uri.toString()}',
                    );
                    Navigator.pop(context);

                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ozelkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).ozelurunler,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                    Navigator.pop(context);
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/yenikatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).urunSerisi2025,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                    Navigator.pop(context);
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ensevilenkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).enCokBegenilenler,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await urunlerigetir(S.of(context).metal, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/metalkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).metal,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await urunlerigetir(S.of(context).ahsap, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ahsapkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).ahsap,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await urunlerigetir(S.of(context).masa, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/masakatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).masa,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await urunlerigetir(S.of(context).sandalye, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/sandalyekatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).sandalye,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await urunlerigetir(S.of(context).ev, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/evkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).ev,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await urunlerigetir(S.of(context).ofis, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ofiskatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            S.of(context).ofis,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future popup() => showDialog(
    context: context,

    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Renkler.kahverengi, width: 1),
          ),
          backgroundColor: Renkler.krem,
          shadowColor: Renkler.kahverengi,
          titlePadding: EdgeInsets.only(top: 0),

          // title: Text(
          //   'Urun Ozellikleri',
          //   style: TextStyle(
          //     color: Renkler.kahverengi,
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 380,

            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: ListView(
                    children: [
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: [
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).agirlik,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${urun['agirlik']}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).materyal,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Cevirici.malzemeCevir(context, urun['materyali'])}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).ortam,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Cevirici.ortamCevir(context, urun['ortam'])}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).tur,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Cevirici.turCevir(context, urun['tur'])}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).ad,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${urun['urunAdi']}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Text(
                        '_${S.of(context).bu_urun_turkiyede_uretilmistir}',
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 12,
                        ),
                      ),

                      Text(
                        '_${S.of(context).urunlerin_garanti_suresi(urun['garantiSuresi'].toString().substring(0, 1))}',
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 12,
                        ),
                      ),

                      SizedBox(width: 5),
                      Text(
                        S
                            .of(context)
                            .urun_aciklamasi(
                              urun['urunAdi'],
                              urun['materyali'],
                              urun['tur'],
                              urun['ortam'],
                              urun['uzunluk'],
                              urun['genislik'],
                            ),
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).ad} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            urun['urunAdi'],
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).agirlik} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            urun['agirlik'].toString(),
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).materyal} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Cevirici.malzemeCevir(context, urun['materyali']),
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).ortam} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Cevirici.ortamCevir(context, urun['ortam']),
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).tur} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Cevirici.turCevir(context, urun['tur']),
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).garanti_suresi}',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            urun['garantiSuresi'].toString().substring(0, 1),

                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 3,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Renkler.kahverengi),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () async {
                          debugPrint('${urun['urunAdi']} tiklandi');
                          begenilmismi
                              ? begenilmismi = false
                              : begenilmismi = true;
                          if (begenilmismi) {
                            setState(() {
                              widget.colored(color: Renkler.kirmizi);
                            });
                            await begenilenekaydet(
                              urun['urunID'],
                              Provider.of<Kullanicilarprovider>(
                                context,
                                listen: false,
                              ).currentkullanici['kullaniciID'],
                            );
                          } else {
                            setState(() {
                              widget.colored(color: Colors.white);
                            });
                            begenilendensil(
                              urun['urunID'],
                              Provider.of<Kullanicilarprovider>(
                                context,
                                listen: false,
                              ).currentkullanici['kullaniciID'],
                            );
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: begenilmismi ? Renkler.kirmizi : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 3,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Renkler.kahverengi),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context); // Popup'ı kapatır
                        },
                        icon: Icon(
                          Icons.close,
                          color: Renkler.kahverengi,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );

  SingleChildScrollView sorucevaplar(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 8, top: 30),
        child: Wrap(
          spacing: 10,
          children: [
            for (Map<String, dynamic> s
                in context.watch<Sorularprovider>().soru_cevaplar)
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.6, color: Renkler.kahverengi),
                  color: const Color.fromARGB(255, 198, 211, 187),
                  borderRadius: BorderRadius.circular(10),
                ),
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
                        width: MediaQuery.of(context).size.width / 1.2 - 50,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Renkler.krem,
                          borderRadius: BorderRadius.circular(10),
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
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView yorumlarseridi(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 8, top: 30),
        child: Wrap(
          spacing: 10,
          children: [
            for (Map<String, dynamic> y
                in context.watch<Yorumlarprovider>().yorumlar)
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.6, color: Renkler.kahverengi),
                    color: const Color.fromARGB(255, 198, 211, 187),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              gizliAdSoyad(y['musteriAdi'], y['musteriSoyadi']),
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              DateFormat(
                                'dd.MM.yyyy',
                              ).format(DateTime.parse(y['yorumTarihi'])),
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
                            y['yorumMetni'].toString().length > 200
                                ? '${y['yorumMetni'].toString().substring(0, 200)}...'
                                : y['yorumMetni'],
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 13,
                            ),
                          ),
                        ),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Wrap KisacaOzellikler(context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 10,
      children: [
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).agirlik,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${urun['agirlik']}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).materyal,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Cevirici.malzemeCevir(context, urun['materyali'])}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).ortam,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Cevirici.ortamCevir(context, urun['ortam'])}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).tur,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Cevirici.turCevir(context, urun['tur'])}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),

        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).ad,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${urun['urunAdi']}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Positioned favoriteIcon() {
    return Positioned(
      top: 35,
      right: 10,
      child: Container(
        width: 27,
        height: 27,
        decoration: BoxDecoration(
          color: Renkler.krem,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Renkler.kahverengi),
        ),
        child: Center(
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () async {
              debugPrint('${urun['urunAdi']} tiklandi');
              begenilmismi ? begenilmismi = false : begenilmismi = true;
              if (begenilmismi) {
                setState(() {
                  widget.colored(color: Renkler.kirmizi);
                });
                await begenilenekaydet(
                  urun['urunID'],
                  Provider.of<Kullanicilarprovider>(
                    context,
                    listen: false,
                  ).currentkullanici['kullaniciID'],
                );
              } else {
                setState(() {
                  widget.colored(color: Colors.white);
                });
                begenilendensil(
                  urun['urunID'],
                  Provider.of<Kullanicilarprovider>(
                    context,
                    listen: false,
                  ).currentkullanici['kullaniciID'],
                );
              }
            },
            icon: Icon(
              Icons.favorite,
              color: begenilmismi ? Renkler.kirmizi : Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Positioned bottomnavigation(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(color: Renkler.krem),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  child: OutlinedButton(
                    onPressed: () async {
                      await sendSMS();
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Renkler.kahverengi),
                      foregroundColor: Renkler.kahverengi,
                    ),
                    child: Text(
                      S.of(context).iletisim,
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () async {
                      await siparisEkle(urun['urunID']);
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
                Text(
                  '(${urun['fiyat']})TL',
                  style: TextStyle(fontSize: 15, color: Renkler.kahverengi),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> urunlerigetir(String aranan, context) async {
    Provider.of<Urunlerprovider>(context, listen: false).currentPage = 1;
    Provider.of<Urunlerprovider>(
      context,
      listen: false,
    ).secilimateryalOgeler.clear();
    Provider.of<Urunlerprovider>(
      context,
      listen: false,
    ).seciliortamOgeler.clear();
    Provider.of<Urunlerprovider>(
      context,
      listen: false,
    ).seciliturOgeler.clear();
    Provider.of<Urunlerprovider>(
      context,
      listen: false,
    ).secilifiyatOgeler.clear();
    Provider.of<Urunlerprovider>(context, listen: false).siralamaolcutu = '';
    Provider.of<Urunlerprovider>(context, listen: false).urunAdi = '';
    Provider.of<Urunlerprovider>(context, listen: false).tarihegore = '';
    debugPrint('urunlerigetir metoduna gelen kelime : $aranan');
    List<String> kelimeler = aranan.toLowerCase().split(
      " ",
    ); // Kullanıcının girdiği kelimeleri parçala.
    List<String> renkler = [
      "Gümüş",
      "Kahverengi",
      "Gri",
      "Siyah",
      "Bej",
      "Lacivert",
      "Beyaz",
      "Mavi",
      "Yeşil",
      "Sarı",
      "Bordo",
      "Turuncu",
      "Kırmızı",
    ];
    List<String> materyaller = ["Ahşap", "Çelik", "Metal"];
    List<String> ortamlar = ["Kafe", "Ofis", "Ev"];
    List<String> turler = ["Sandalye", "Masa"];
    bool eslesenkelimevarmi = false;
    for (String renk in renkler) {
      for (String kelime in kelimeler) {
        if (Cevirici.renkCevir(context, renk).toLowerCase().contains(kelime)) {
          Provider.of<Urunlerprovider>(context).secilirenkOgeler.add(kelime);
          eslesenkelimevarmi = true;
        }
      }
    }
    for (String materyal in materyaller) {
      for (String kelime in kelimeler) {
        if (Cevirici.malzemeCevir(
          context,
          materyal,
        ).toLowerCase().contains(kelime)) {
          Provider.of<Urunlerprovider>(
            context,
            listen: false,
          ).secilimateryalOgeler.add(kelime);
          eslesenkelimevarmi = true;
        }
      }
    }
    for (String ortam in ortamlar) {
      for (String kelime in kelimeler) {
        if (Cevirici.ortamCevir(
          context,
          ortam,
        ).toLowerCase().contains(kelime)) {
          Provider.of<Urunlerprovider>(
            context,
            listen: false,
          ).seciliortamOgeler.add(kelime);
          eslesenkelimevarmi = true;
        }
      }
    }
    for (String tur in turler) {
      for (String kelime in kelimeler) {
        if (Cevirici.turCevir(context, tur).toLowerCase().contains(kelime)) {
          Provider.of<Urunlerprovider>(
            context,
            listen: false,
          ).seciliturOgeler.add(kelime);
          eslesenkelimevarmi = true;
        }
      }
    }

    if (kelimeler.length == 1 && !eslesenkelimevarmi) {
      Provider.of<Urunlerprovider>(context, listen: false).urunAdi =
          kelimeler.first;
    }

    GoRouter.of(context).push(Paths.tumurunler);
  }

  Future<void> sendSMS() async {
    final Uri whatsappUri = Uri.parse(
      "whatsapp://send?phone=905372943871&text=*${urun['urunAdi']}* kodlu *${urun['materyali']}* *${urun['tur']}* hakkinda soru sormak istiyordum",
    );

    try {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("WhatsApp açılamadı! Hata: $e")));
    }
  }

  Widget yorumKarti({
    required String isim,
    required String tarih,
    required String yorum,
    required String satici,
  }) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 198, 211, 187),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Renkler.kahverengi),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // İsim ve Tarih
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(isim, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                tarih,
                style: const TextStyle(fontSize: 12, color: Renkler.kahverengi),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Yıldızlar
          const SizedBox(height: 8),
          // Yorum
          Text(yorum, maxLines: 4, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Text(
            "Satıcı: $satici",
            style: const TextStyle(fontSize: 12, color: Renkler.kahverengi),
          ),
        ],
      ),
    );
  }

  Future<void> siparisEkle(int urunID) async {
    await Siparislervt.siparisEkle(
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
      urunID,
    );
    await siparisleriYukle();
    await Provider.of<Siparislerprovider>(
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
