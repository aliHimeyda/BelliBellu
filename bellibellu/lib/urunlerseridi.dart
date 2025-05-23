import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grock/grock.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Serid extends StatefulWidget {
  final String vasif;
  Map<String, dynamic> seridkategorisi = {};
  Serid({super.key, required this.vasif, required this.seridkategorisi});

  @override
  State<Serid> createState() => _SeridState();
}

class _SeridState extends State<Serid> {
  late List<Map<String, dynamic>> urunler = [];
  @override
  void initState() {
    getfirsturuns();
    super.initState();
  }

  Future<void> getfirsturuns() async {
    Provider.of<Urunlerprovider>(context, listen: false).urunler.clear();
    final newItems = await Urunlervt.getMoreUrun(
      widget.seridkategorisi['currentPage'],
      widget.seridkategorisi['secilimateryalOgeler'] as List<String>? ?? [],
      widget.seridkategorisi['seciliortamOgeler'] as List<String>? ?? [],
      widget.seridkategorisi['seciliturOgeler'] as List<String>? ?? [],
      widget.seridkategorisi['secilifiyatOgeler'] as List<Map<String, int>>? ??
          [],
      widget.seridkategorisi['siralamaolcutu'] as String?,
      widget.seridkategorisi['urunAdi'] as String?,
      widget.seridkategorisi['tarihegore'] as String?,
    );
    urunler.addAll(newItems);
  }

  @override
  Widget build(BuildContext context) {
    const int urunKartiGenisligi = 150;
    debugPrint('${widget.vasif} olusturuldu');

    // return FutureBuilder<void>(
    //     // future: _urunlerFuture, // Dosya okuma işlemini başlat
    //     // builder: (context, snapshot) {
    //     //   if (snapshot.connectionState == ConnectionState.waiting) {
    //     //     return const Center(
    //     //         child: CircularProgressIndicator()); // Yükleniyor göstergesi
    //     //   } else if (snapshot.hasError) {
    //     //     debugPrint("🚨 Hata: ${snapshot.error}");
    //     //     return const Center(child: Text('Dosya okunurken hata oluştu!'));
    //     //   } else {
    //     //     debugPrint("✔ Hata yok ");

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width - 10,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // Yatayda yan yana düzenlemeyi aktif et
            children: [
              Text(
                widget.vasif,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  final routeName = GoRouterState.of(context).name;
                  final index = GoRouterState.of(context).uri.toString();
                  Provider.of<Urunlerprovider>(context, listen: false)
                      .currentPage = widget.seridkategorisi['currentPage'];
                  Provider.of<Urunlerprovider>(
                        context,
                        listen: false,
                      ).secilimateryalOgeler =
                      widget.seridkategorisi['secilimateryalOgeler']
                          as List<String>? ??
                      [];
                  Provider.of<Urunlerprovider>(
                        context,
                        listen: false,
                      ).seciliortamOgeler =
                      widget.seridkategorisi['seciliortamOgeler']
                          as List<String>? ??
                      [];
                  Provider.of<Urunlerprovider>(
                        context,
                        listen: false,
                      ).seciliturOgeler =
                      widget.seridkategorisi['seciliturOgeler']
                          as List<String>? ??
                      [];
                  Provider.of<Urunlerprovider>(
                        context,
                        listen: false,
                      ).secilifiyatOgeler =
                      widget.seridkategorisi['secilifiyatOgeler']
                          as List<Map<String, int>>? ??
                      [];
                  Provider.of<Urunlerprovider>(
                        context,
                        listen: false,
                      ).siralamaolcutu =
                      widget.seridkategorisi['siralamaolcutu'] ?? '';
                  Provider.of<Urunlerprovider>(context, listen: false).urunAdi =
                      widget.seridkategorisi['urunAdi'] ?? '';
                  Provider.of<Urunlerprovider>(context, listen: false)
                      .tarihegore = widget.seridkategorisi['tarihegore'] ?? '';
                  if (routeName == null && index == '/urundetaylari') {
                    Navigator.pop(context);
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  } else {
                    debugPrint('tiklandi');
                    context.push('/tumurunler'); // Sayfaya nesneyi geçir)
                  }
                },
                child: Row(
                  children: [
                    Text(
                      S.of(context).tumurunler,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Renkler.kahverengi,
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
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Yatay kaydırmayı aktif et
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Wrap(
              spacing: 10,
              children: [
                for (Map<String, dynamic> urun in urunler)
                  Urunkarti(urun: urun),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: urunKartiGenisligi - 2,
                    height: urunKartiGenisligi * 1.8,
                    padding: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Renkler.krem, Renkler.kuyubeyaz],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Renkler.gri),
                      boxShadow: const [
                        BoxShadow(
                          color: Renkler.gri,
                          blurRadius: 10,
                          spreadRadius: 3,
                          offset: Offset(2, 5),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        final routeName = GoRouterState.of(context).name;
                        final index = GoRouterState.of(context).uri.toString();
                        Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).currentPage =
                            widget.seridkategorisi['currentPage'];
                        Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilimateryalOgeler =
                            widget.seridkategorisi['secilimateryalOgeler'];
                        Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliortamOgeler =
                            widget.seridkategorisi['seciliortamOgeler'];
                        Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliturOgeler =
                            widget.seridkategorisi['seciliturOgeler'];
                        Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler =
                            widget.seridkategorisi['secilifiyatOgeler'];
                        Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).siralamaolcutu =
                            widget.seridkategorisi['siralamaolcutu'];
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .urunAdi = widget.seridkategorisi['urunAdi'];
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .tarihegore = widget.seridkategorisi['tarihegore'];
                        if (routeName == null && index == '/urundetaylari') {
                          Navigator.pop(context);

                          GoRouter.of(
                            context,
                          ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                        } else {
                          debugPrint('tiklandi');
                          context.push('/tumurunler'); // Sayfaya nesneyi geçir)
                        }
                      },
                      child: Center(
                        // 📌 Ana container içindeki her şeyi ortalamak için
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center, // 📌 Dikey eksende ortala
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .center, // 📌 Yatay eksende ortala
                          children: [
                            Text(
                              S.of(context).tumurunler,
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontWeight: FontWeight.bold,
                                fontSize: 15, // 📌 Daha okunaklı hale getirdik
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ), // 📌 Metin ile ikon arasına boşluk ekledik
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape:
                                    BoxShape.circle, // 📌 Yuvarlak çerçeve için
                                border: Border.all(
                                  color: Renkler.kahverengi,
                                  width: 2,
                                ), // 📌 Çerçeve ekledik
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.chevron_right,
                                  size: 25,
                                  color: Renkler.kahverengi,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
