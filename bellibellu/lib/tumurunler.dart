import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tumurunler extends StatefulWidget {
  const Tumurunler({super.key});

  @override
  State<Tumurunler> createState() => _TumurunlerState();
}

class _TumurunlerState extends State<Tumurunler> {
  late int currentPage =
      Provider.of<Urunlerprovider>(context, listen: false).currentPage;
  late List<String> secilimateryalOgeler =
      Provider.of<Urunlerprovider>(context, listen: false).secilimateryalOgeler;
  late List<String> seciliortamOgeler =
      Provider.of<Urunlerprovider>(context, listen: false).seciliortamOgeler;
  late List<String> seciliturOgeler =
      Provider.of<Urunlerprovider>(context, listen: false).seciliturOgeler;
  late List<String> secilirenkOgeler =
      Provider.of<Urunlerprovider>(context, listen: false).secilirenkOgeler;
  late List<Map<String, int>> secilifiyatOgeler =
      Provider.of<Urunlerprovider>(context, listen: false).secilifiyatOgeler;
  late String urunAdi =
      Provider.of<Urunlerprovider>(context, listen: false).urunAdi;
  late String siralamaolcutu =
      Provider.of<Urunlerprovider>(context, listen: false).siralamaolcutu;
  late String tarihegore =
      Provider.of<Urunlerprovider>(context, listen: false).tarihegore;
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

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getMoreUrunler();
    });
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
    final newItems = await Urunlervt.getMoreUrun(
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
    Provider.of<Urunlerprovider>(
      context,
      listen: false,
    ).urunler.addAll(newItems);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ListView.builder(
              itemCount: urunkartlari.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                debugPrint('$index from ${urunkartlari.length}');
                return Center(
                  child: Column(
                    children: [
                      urunkartlari[index],
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
        ),

        ustsecenekler(context),
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

  SafeArea ustsecenekler(BuildContext context) {
    return SafeArea(
      child: Positioned(
        top: 0,
        child: Container(
          width: (MediaQuery.of(context).size.width),
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 0.5, color: Renkler.kahverengi),
            ),
            color: Renkler.kuyubeyaz,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint('tiklandi');
                  _showMultiSelectDialog(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Renkler.kuyubeyaz,
                    border: Border(
                      right: BorderSide(width: 0.5, color: Renkler.kahverengi),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sort, color: Renkler.kahverengi, size: 18),
                        Text(
                          S.of(context).sirala,
                          style: TextStyle(
                            color: Renkler.kahverengi,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('tiklandi');
                  filitredialogugoster(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  decoration: BoxDecoration(color: Renkler.kuyubeyaz),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.filter_alt,
                          color: Renkler.kahverengi,
                          size: 18,
                        ),
                        Text(
                          S.of(context).filtrele,
                          style: TextStyle(
                            color: Renkler.kahverengi,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMultiSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                S.of(context).sirala,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,
              iconColor: Renkler.koyuYesil,

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).onerilen,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: 'onerilen',
                    groupValue:
                        Provider.of<Urunlerprovider>(
                          context,
                          listen: false,
                        ).siralamaolcutu, // ✅ Doğru kullanım
                    onChanged: (String? value) {
                      setState(() {
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .siralamaolcutu = (Provider.of<Urunlerprovider>(
                                      context,
                                      listen: false,
                                    ).siralamaolcutu ==
                                    value)
                                ? ""
                                : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_dusuk_fiyat,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: 'endusukfiyat',
                    groupValue:
                        Provider.of<Urunlerprovider>(
                          context,
                          listen: false,
                        ).siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .siralamaolcutu = (Provider.of<Urunlerprovider>(
                                      context,
                                      listen: false,
                                    ).siralamaolcutu ==
                                    value)
                                ? ""
                                : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_yuksek_fiyat,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: 'enyuksekfiyat',
                    groupValue:
                        Provider.of<Urunlerprovider>(
                          context,
                          listen: false,
                        ).siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .siralamaolcutu = (Provider.of<Urunlerprovider>(
                                      context,
                                      listen: false,
                                    ).siralamaolcutu ==
                                    value)
                                ? ""
                                : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_cok_begenilen,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: 'encokbegenilen',
                    groupValue:
                        Provider.of<Urunlerprovider>(
                          context,
                          listen: false,
                        ).siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .siralamaolcutu = (Provider.of<Urunlerprovider>(
                                      context,
                                      listen: false,
                                    ).siralamaolcutu ==
                                    value)
                                ? ""
                                : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_yeni_urunler,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: 'enyeniurunler',
                    groupValue:
                        Provider.of<Urunlerprovider>(
                          context,
                          listen: false,
                        ).siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .siralamaolcutu = (Provider.of<Urunlerprovider>(
                                      context,
                                      listen: false,
                                    ).siralamaolcutu ==
                                    value)
                                ? ""
                                : value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () async {
                      debugPrint(
                        'Seçilen: $Provider.of<Urunlerprovider>(context, listen: false).siralamaolcutu',
                      );
                      await degisikliklerikaydet();
                      Navigator.pop(context);
                    },
                    child: Text(
                      S.of(context).uygula,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void filitredialogugoster(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,

              title: Text(
                S.of(context).filtrele,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        materyaldialogu(context);
                      },
                      child: Container(
                        width: 250,
                        height: 50,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).materyal,
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Renkler.kahverengi,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        ortamdialogu(context);
                      },
                      child: Container(
                        width: 250,
                        height: 50,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).ortam,
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Renkler.kahverengi,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        turdialogu(context);
                      },
                      child: Container(
                        width: 250,
                        height: 50,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).tur,
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Renkler.kahverengi,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        fiyatdialogu(context);
                      },
                      child: Container(
                        width: 250,
                        height: 50,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              S.of(context).fiyat,
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Renkler.kahverengi,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        S.of(context).urunleri_getir,
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .currentPage = 1;
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
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .siralamaolcutu = '';
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .urunAdi = '';
                        Provider.of<Urunlerprovider>(context, listen: false)
                            .tarihegore = '';
                        await degisikliklerikaydet();
                        Navigator.pop(context);
                      },
                      child: Text(
                        S.of(context).temizle,
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  void fiyatdialogu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,

              title: Text(
                S.of(context).fiyata_gore,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "1000-2000",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilifiyatOgeler.contains({'min': 1000, 'max': 2000}),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.add({'min': 1000, 'max': 2000})
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.remove({
                              'min': 1000,
                              'max': 2000,
                            });
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "2000-3000",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilifiyatOgeler.contains({'min': 2000, 'max': 3000}),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.add({'min': 2000, 'max': 3000})
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.remove({
                              'min': 2000,
                              'max': 3000,
                            });
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "3000-4000",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilifiyatOgeler.contains({'min': 3000, 'max': 4000}),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.add({'min': 3000, 'max': 4000})
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.remove({
                              'min': 3000,
                              'max': 4000,
                            });
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "4000-5000",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilifiyatOgeler.contains({'min': 4000, 'max': 5000}),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.add({'min': 4000, 'max': 5000})
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilifiyatOgeler.remove({
                              'min': 4000,
                              'max': 5000,
                            });
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilifiyatOgeler.isNotEmpty) {
                      await degisikliklerikaydet();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).uygula,
                    style: TextStyle(
                      color: Renkler.kahverengi,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void materyaldialogu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,

              title: Text(
                S.of(context).materyale_gore,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).celik,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilimateryalOgeler.contains('Çelik'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilimateryalOgeler.add('Çelik')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilimateryalOgeler.remove('Çelik');
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).ahsap,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilimateryalOgeler.contains('Ahşap'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilimateryalOgeler.add('Ahşap')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilimateryalOgeler.remove('Ahşap');
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).metal,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilimateryalOgeler.contains('Metal'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilimateryalOgeler.add('Metal')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).secilimateryalOgeler.remove('Metal');
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilimateryalOgeler.isNotEmpty) {
                      await degisikliklerikaydet();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).uygula,
                    style: TextStyle(
                      color: Renkler.kahverengi,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void ortamdialogu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,

              title: Text(
                S.of(context).ortama_gore,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).kafe,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliortamOgeler.contains('Kafe'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliortamOgeler.add('Kafe')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliortamOgeler.remove('Kafe');
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).ofis,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliortamOgeler.contains('Ofis'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliortamOgeler.add('Ofis')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliortamOgeler.remove('Ofis');
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).ev,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliortamOgeler.contains('Ev'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliortamOgeler.add('Ev')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliortamOgeler.remove('Ev');
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliortamOgeler.isNotEmpty) {
                      await degisikliklerikaydet();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).uygula,
                    style: TextStyle(
                      color: Renkler.kahverengi,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void turdialogu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,

              title: Text(
                S.of(context).ture_gore,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).masa,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliturOgeler.contains('masa'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliturOgeler.add('masa')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliturOgeler.remove('masa');
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).sandalye,
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliturOgeler.contains('sandalye'),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliturOgeler.add('sandalye')
                            : Provider.of<Urunlerprovider>(
                              context,
                              listen: false,
                            ).seciliturOgeler.remove('sandalye');
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    if (Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliturOgeler.isNotEmpty) {
                      await degisikliklerikaydet();
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    S.of(context).uygula,
                    style: TextStyle(
                      color: Renkler.kahverengi,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> degisikliklerikaydet() async {
    setState(() {
      urunkartlari.clear();
    });
    Provider.of<Urunlerprovider>(context, listen: false).urunler.clear();
    await getMoreUrunler();
  }
}
