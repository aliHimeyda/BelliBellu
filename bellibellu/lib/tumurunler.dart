import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';

class Tumurunler extends StatefulWidget {
  const Tumurunler({super.key});

  @override
  State<Tumurunler> createState() => _TumurunlerState();
}

class _TumurunlerState extends State<Tumurunler> {
  int urunlersayisi = 0;
  int bulunanurunsayisi = 0;
  List<String> seciliOgeler = [];
  String siralamaolcutu = "";
  List<Ozelurunkarti> urunler = [];
  Future<void> kartlariolustur() async {
    for (Urunler urun in Urunler.urunler) {
      Ozelurunkarti kart = await Ozelurunkarti(urun: urun);
      urunler.add(kart);
    }
    setState(() {
      urunler;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await kartlariolustur();
      setState(() {
        urunler;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ListView.builder(
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                final Ozelurunkarti urun = urunler[index];
                debugPrint('$index from ${urunler.length}');
                return Center(
                  child: Column(children: [urun, SizedBox(height: 7)]),
                );
              },
            ),
          ),
        ),

        ustsecenekler(context),
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
                    value: S.of(context).onerilen,
                    groupValue: siralamaolcutu, // ✅ Doğru kullanım
                    onChanged: (String? value) {
                      setState(() {
                        siralamaolcutu =
                            (siralamaolcutu == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_dusuk_fiyat,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).en_dusuk_fiyat,
                    groupValue: siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        siralamaolcutu =
                            (siralamaolcutu == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_yuksek_fiyat,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).en_yuksek_fiyat,
                    groupValue: siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        siralamaolcutu =
                            (siralamaolcutu == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_cok_begenilen,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).en_cok_begenilen,
                    groupValue: siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        siralamaolcutu =
                            (siralamaolcutu == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).en_yeni_urunler,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).en_yeni_urunler,
                    groupValue: siralamaolcutu,
                    onChanged: (String? value) {
                      setState(() {
                        siralamaolcutu =
                            (siralamaolcutu == value) ? "" : value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () async {
                      debugPrint('Seçilen: $siralamaolcutu');
                      await urunlerisirala(siralamaolcutu);
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

  Future<void> urunlerisirala(String siralamaolcutu) async {
    List<Ozelurunkarti> yeniliste = List.from(
      urunler,
    ); // Yeni bir kopya oluştur
    if (siralamaolcutu == S.of(context).onerilen) {
      setState(() {
        debugPrint('onerilen');
        urunler = yeniliste.reversed.toList();
      });
    } else if (siralamaolcutu == S.of(context).en_dusuk_fiyat) {
      yeniliste.sort(
        (a, b) => a.urun.urunfiyati.compareTo(b.urun.urunfiyati),
      ); // Küçükten büyüğe sırala
      setState(() {
        debugPrint('endusukfiyat');

        urunler = yeniliste;
      });
    } else if (siralamaolcutu == S.of(context).en_yuksek_fiyat) {
      yeniliste.sort(
        (a, b) => b.urun.urunfiyati.compareTo(a.urun.urunfiyati),
      ); // Büyükten küçüğe sırala
      setState(() {
        debugPrint('enyuksekfiyat');

        urunler = yeniliste;
      });
    } else if (siralamaolcutu == S.of(context).en_cok_begenilen) {
      yeniliste.sort(
        (a, b) => b.urun.begenisayisi.compareTo(a.urun.begenisayisi),
      ); // Büyükten küçüğe sırala
      setState(() {
        debugPrint('en cok begenilen');

        urunler = yeniliste;
      });
    } else if (siralamaolcutu == S.of(context).en_yeni_urunler) {
      setState(() {
        debugPrint('en yeni');

        urunler = yeniliste.reversed.toList();
      });
    } else {
      setState(() {
        debugPrint('diger');

        urunler = yeniliste.reversed.toList();
      });
    }
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
                        seciliOgeler.clear();
                        urunler.clear();
                        await kartlariolustur();
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
                    value: seciliOgeler.contains("1000-2000"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("1000-2000")
                            : seciliOgeler.remove("1000-2000");
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
                    value: seciliOgeler.contains("2000-3000"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("2000-3000")
                            : seciliOgeler.remove("2000-3000");
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
                    value: seciliOgeler.contains("3000-4000"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("3000-4000")
                            : seciliOgeler.remove("3000-4000");
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
                    value: seciliOgeler.contains("4000-5000"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("4000-5000")
                            : seciliOgeler.remove("4000-5000");
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    debugPrint('$seciliOgeler');
                    if (seciliOgeler.contains('4000-5000') ||
                        seciliOgeler.contains('3000-4000') ||
                        seciliOgeler.contains('1000-2000') ||
                        seciliOgeler.contains('2000-3000')) {
                      await fiyatfilitresi(seciliOgeler);
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

  Future<void> fiyatfilitresi(List<String> secimler) async {
    List<Ozelurunkarti> yeniliste = [];
    // Fiyat filtresi işlemleri burada yapılabilir.

    if (secimler.contains('1000-2000')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.urunfiyati >= 1000 &&
            urunler[i].urun.urunfiyati <= 2000) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('2000-3000')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.urunfiyati > 2000 &&
            urunler[i].urun.urunfiyati <= 3000) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('3000-4000')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.urunfiyati > 3000 &&
            urunler[i].urun.urunfiyati <= 4000) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('4000-5000')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.urunfiyati > 4000 &&
            urunler[i].urun.urunfiyati <= 5000) {
          yeniliste.add(urunler[i]);
        }
      }
    }

    setState(() {
      urunler = yeniliste.toList();
      bulunanurunsayisi = urunler.length;
    });
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
                    value: seciliOgeler.contains(S.of(context).celik),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).celik)
                            : seciliOgeler.remove(S.of(context).celik);
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
                    value: seciliOgeler.contains(S.of(context).ahsap),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).ahsap)
                            : seciliOgeler.remove(S.of(context).ahsap);
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
                    value: seciliOgeler.contains(S.of(context).metal),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).metal)
                            : seciliOgeler.remove(S.of(context).metal);
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    debugPrint('$seciliOgeler');
                    if (seciliOgeler.contains(S.of(context).metal) ||
                        seciliOgeler.contains(S.of(context).ahsap) ||
                        seciliOgeler.contains(S.of(context).celik)) {
                      await materyalfilitresi(seciliOgeler);
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

  Future<void> materyalfilitresi(List<String> secimler) async {
    List<Ozelurunkarti> yeniliste = [];
    // Fiyat filtresi işlemleri burada yapılabilir.
    if (secimler.contains(S.of(context).celik)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.materyali == S.of(context).celik) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains(S.of(context).ahsap)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.materyali == S.of(context).ahsap) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains(S.of(context).metal)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.materyali == S.of(context).metal) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    debugPrint('yeniliste urunler listesine aktarildi');
    setState(() {
      urunler = yeniliste.toList();
      bulunanurunsayisi = urunler.length;
    });
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
                    value: seciliOgeler.contains(S.of(context).kafe),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).kafe)
                            : seciliOgeler.remove(S.of(context).kafe);
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
                    value: seciliOgeler.contains(S.of(context).ofis),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).ofis)
                            : seciliOgeler.remove(S.of(context).ofis);
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
                    value: seciliOgeler.contains(S.of(context).ev),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).ev)
                            : seciliOgeler.remove(S.of(context).ev);
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    debugPrint('$seciliOgeler');
                    if (seciliOgeler.contains(S.of(context).ev) ||
                        seciliOgeler.contains(S.of(context).kafe) ||
                        seciliOgeler.contains(S.of(context).ofis)) {
                      await ortamfilitresi(seciliOgeler);
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

  Future<void> ortamfilitresi(List<String> secimler) async {
    List<Ozelurunkarti> yeniliste = [];
    // Fiyat filtresi işlemleri burada yapılabilir.
    if (secimler.contains(S.of(context).kafe)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.ortami == S.of(context).kafe) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains(S.of(context).ofis)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.ortami == S.of(context).ofis) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains(S.of(context).ev)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.ortami == S.of(context).ev) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    debugPrint('yeniliste urunler listesine aktarildi');

    setState(() {
      urunler = yeniliste.toList();
      bulunanurunsayisi = urunler.length;
    });
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
                    value: seciliOgeler.contains(S.of(context).masa),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).masa)
                            : seciliOgeler.remove(S.of(context).masa);
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
                    value: seciliOgeler.contains(S.of(context).sandalye),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add(S.of(context).sandalye)
                            : seciliOgeler.remove(S.of(context).sandalye);
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    debugPrint('$seciliOgeler');
                    if (seciliOgeler.contains(S.of(context).masa) ||
                        seciliOgeler.contains(S.of(context).sandalye)) {
                      await turfilitresi(seciliOgeler);
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

  Future<void> turfilitresi(List<String> secimler) async {
    List<Ozelurunkarti> yeniliste = [];
    // Fiyat filtresi işlemleri burada yapılabilir.
    if (secimler.contains(S.of(context).masa)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.turu == S.of(context).masa) {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains(S.of(context).sandalye)) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.turu == S.of(context).sandalye) {
          yeniliste.add(urunler[i]);
        }
      }
    }

    debugPrint('yeniliste urunler listesine aktarildi');

    setState(() {
      urunler = yeniliste.toList();
      bulunanurunsayisi = urunler.length;
    });
  }
}
