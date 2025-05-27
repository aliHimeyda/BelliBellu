import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grock/grock.dart';
import 'package:provider/provider.dart';

class Takimlar extends StatefulWidget {
  const Takimlar({super.key});

  @override
  State<Takimlar> createState() => _TakimlarState();
}

class _TakimlarState extends State<Takimlar> {
  final ScrollController _scrollController = ScrollController();
  late Future<void> takimlar;
  late bool takimlistesisonumu = false;

  @override
  void initState() {
    super.initState();
    takimlar = takimlarigetir();
    Future.delayed(Duration.zero, () {
      takimlarigetir();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels -
              _scrollController.position.maxScrollExtent <=
          200) {
        if (!takimlistesisonumu) {
          Provider.of<Urunlerprovider>(
            context,
            listen: false,
          ).takimcurrentPage++;
          takimlarigetir();
        }
      }
    });
  }

  Future<void> takimlarigetir() async {
    final newItems = await Urunlervt.getMoretakim(
      Provider.of<Urunlerprovider>(context, listen: false).takimcurrentPage,
      [],
      [],
      [],
      [],
      '',
      '',
      '',
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
    );
    if (newItems.length < 15) {
      takimlistesisonumu = true;
    }
    Provider.of<Urunlerprovider>(
      context,
      listen: false,
    ).takimlar.addAll(newItems);
    Provider.of<Urunlerprovider>(context, listen: false).guncelle();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: takimlar,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Renkler.kahverengi),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
        }
        if (context.watch<Urunlerprovider>().takimlar.length > 0) {
          return ListView.builder(
            itemCount: context.watch<Urunlerprovider>().takimlar.length,
            itemBuilder: (context, index) {
              return buildCard(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${S.of(context).takimKodu}: ${context.watch<Urunlerprovider>().takimlar[index]['takimID']}',
                      ),
                      Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Renkler.krem,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Renkler.kahverengi),
                        ),
                        child: Center(
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () async {
                              Provider.of<Urunlerprovider>(
                                        context,
                                        listen: false,
                                      ).takimlar[index]['begenilmismi'] ==
                                      0
                                  ? Provider.of<Urunlerprovider>(
                                        context,
                                        listen: false,
                                      ).takimlar[index]['begenilmismi'] =
                                      false
                                  : Provider.of<Urunlerprovider>(
                                        context,
                                        listen: false,
                                      ).takimlar[index]['begenilmismi'] =
                                      true;

                              if (Provider.of<Urunlerprovider>(
                                    context,
                                    listen: false,
                                  ).takimlar[index]['begenilmismi'] ==
                                  true) {
                                setState(() {
                                  widget.colored(color: Renkler.kirmizi);
                                });
                                // await begenilenekaydet(
                                //   context.watch<Urunlerprovider>().takimlar[index]['takimID'],
                                //   Provider.of<Kullanicilarprovider>(
                                //     context,
                                //     listen: false,
                                //   ).currentkullanici['kullaniciID'],
                                // );
                              } else {
                                setState(() {
                                  widget.colored(color: Colors.white);
                                });
                                // begenilendensil(
                                //  context.watch<Urunlerprovider>().takimlar[index]['takimID'],
                                //   Provider.of<Kullanicilarprovider>(
                                //     context,
                                //     listen: false,
                                //   ).currentkullanici['kullaniciID'],
                                // );
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  Provider.of<Urunlerprovider>(
                                            context,
                                            listen: false,
                                          ).takimlar[index]['begenilmismi'] ==
                                          1
                                      ? Renkler.kirmizi
                                      : Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Renkler.kahverengi),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 50,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.push(
                            Paths.urundetaylari,
                            extra:
                                Provider.of<Urunlerprovider>(
                                  context,
                                  listen: false,
                                ).takimlar[index]['masaadi'],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Renkler.kahverengi,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          width: 150,
                          height: 150,
                          child: Image.network(
                            fit: BoxFit.cover,
                            context
                                .watch<Urunlerprovider>()
                                .takimlar[index]['masaresmi'],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(
                            Paths.urundetaylari,
                            extra:
                                Provider.of<Urunlerprovider>(
                                  context,
                                  listen: false,
                                ).takimlar[index]['sandalyeadi'],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Renkler.kahverengi,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          width: 150,
                          height: 150,
                          child: Image.network(
                            fit: BoxFit.cover,
                            context
                                .watch<Urunlerprovider>()
                                .takimlar[index]['sandalyeresmi'],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: Renkler.kahverengi),
                  SizedBox(height: 5),
                  Column(
                    children: [
                      buildRow(
                        S.of(context).masaAdi,
                        context
                            .watch<Urunlerprovider>()
                            .takimlar[index]['masaadi'],
                      ),
                      buildRow(
                        S.of(context).masaSatici,
                        '${context.watch<Urunlerprovider>().takimlar[index]['masasaticiadi']} ${context.watch<Urunlerprovider>().takimlar[index]['masasaticisoyadi']}',
                      ),
                      buildRow(
                        S.of(context).sandalyeAdi,
                        context
                            .watch<Urunlerprovider>()
                            .takimlar[index]['sandalyeadi'],
                      ),
                      buildRow(
                        S.of(context).sandalyeSatici,
                        '${context.watch<Urunlerprovider>().takimlar[index]['sandalyesaticiadi']} ${context.watch<Urunlerprovider>().takimlar[index]['sandalyesaticisoyadi']}',
                      ),
                      buildRow(
                        S.of(context).sandalyeSayisi,
                        context
                            .watch<Urunlerprovider>()
                            .takimlar[index]['sandalyeSayisi']
                            .toString(),
                      ),
                      buildRow(
                        S.of(context).toplam,
                        context
                            .watch<Urunlerprovider>()
                            .takimlar[index]['toplamFiyat']
                            .toString(),
                      ),
                    ],
                  ),
                ],
              );
            },
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
                        'assets/heart.png',
                        color: Renkler.kahverengi,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).begenilen_urun_listesi_bos,
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
    );
  }

  Widget buildCard({required List<Widget> children}) {
    return Card(
      color: Renkler.krem,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: children),
      ),
    );
  }

  Widget buildRow(
    String label,
    String value, {
    bool bold = false,
    Color? color,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: bold ? TextStyle(fontWeight: FontWeight.bold) : null,
          ),
          Text(value, style: TextStyle(color: valueColor ?? color)),
        ],
      ),
    );
  }
}
