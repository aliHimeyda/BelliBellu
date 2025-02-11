import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';

class Ozelurunler extends StatefulWidget {
  final List<Urunler> gelenurunler;
  const Ozelurunler({super.key, required this.gelenurunler});

  @override
  State<Ozelurunler> createState() => _OzelurunlerState();
}

class _OzelurunlerState extends State<Ozelurunler> {
  int urunlersayisi = 0;
  int bulunanurunsayisi = 0;
  List<String> seciliOgeler = [];
  String siralamaolcutu = "";
  List<Ozelurunkarti> urunler = [];
  Future<void> kartlariolustur() async {
    urunler.clear();
    for (Urunler urun in widget.gelenurunler) {
      Ozelurunkarti kart = await Ozelurunkarti(urun: urun);
      urunler.add(kart);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await kartlariolustur();
      debugPrint(
        'initState calisti gelen verilerin boyutu : ${widget.gelenurunler.length}',
      );
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
                          'SIRALA',
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
                          'FILITRE',
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
                "SIRALAMA ",
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
                      "Önerilen",
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: "Önerilen",
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
                      "En Düşük Fiyat",
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: "En Düşük Fiyat",
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
                      "En Yüksek Fiyat",
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: "En Yüksek Fiyat",
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
                      "En Çok Beğenilen",
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: "En Çok Beğenilen",
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
                      "En Yeni Ürünler",
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: "En Yeni Ürünler",
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
                      "Uygula",
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
    if (siralamaolcutu == "Önerilen") {
      setState(() {
        debugPrint('onerilen');
        urunler = yeniliste.reversed.toList();
      });
    } else if (siralamaolcutu == "En Düşük Fiyat") {
      yeniliste.sort(
        (a, b) => a.urun.urunfiyati.compareTo(b.urun.urunfiyati),
      ); // Küçükten büyüğe sırala
      setState(() {
        debugPrint('endusukfiyat');

        urunler = yeniliste;
      });
    } else if (siralamaolcutu == "En Yüksek Fiyat") {
      yeniliste.sort(
        (a, b) => b.urun.urunfiyati.compareTo(a.urun.urunfiyati),
      ); // Büyükten küçüğe sırala
      setState(() {
        debugPrint('enyuksekfiyat');

        urunler = yeniliste;
      });
    } else if (siralamaolcutu == "En Çok Beğenilen") {
      yeniliste.sort(
        (a, b) => b.urun.begenisayisi.compareTo(a.urun.begenisayisi),
      ); // Büyükten küçüğe sırala
      setState(() {
        debugPrint('en cok begenilen');

        urunler = yeniliste;
      });
    } else if (siralamaolcutu == "En Yeni Ürünler") {
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
                "FILITRELE",
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
                              'Materyal',
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
                              'Ortam',
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
                              'Tur',
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
                              'Fiyat',
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
                        "Urunleri Getir",
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
                        "Temizle",
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
                "Fiyata Gore :",
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
                    "Uygula",
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
                "Materyala Gore :",
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
                      "Çelik",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Çelik"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Çelik")
                            : seciliOgeler.remove("Çelik");
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "Ahşap",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Ahşap"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Ahşap")
                            : seciliOgeler.remove("Ahşap");
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "Metal",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Metal"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Metal")
                            : seciliOgeler.remove("Metal");
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    debugPrint('$seciliOgeler');
                    if (seciliOgeler.contains('Metal') ||
                        seciliOgeler.contains('Ahşap') ||
                        seciliOgeler.contains('Çelik')) {
                      await materyalfilitresi(seciliOgeler);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Uygula",
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
    if (secimler.contains('Çelik')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.materyali == 'Çelik') {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('Ahşap')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.materyali == 'Ahşap') {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('Metal')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.materyali == 'Metal') {
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
                "Ortama Gore :",
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
                      "Kafe",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Kafe"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Kafe")
                            : seciliOgeler.remove("Kafe");
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "Ofis",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Ofis"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Ofis")
                            : seciliOgeler.remove("Ofis");
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "Ev",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Ev"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Ev")
                            : seciliOgeler.remove("Ev");
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    debugPrint('$seciliOgeler');
                    if (seciliOgeler.contains('Ofis') ||
                        seciliOgeler.contains('Ev') ||
                        seciliOgeler.contains('Kafe')) {
                      await ortamfilitresi(seciliOgeler);
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Uygula",
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
    if (secimler.contains('Kafe')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.ortami == 'Kafe') {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('Ofis')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.ortami == 'Ofis') {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('Ev')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.ortami == 'Ev') {
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
                "Tür'a Gore :",
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
                      "Masa",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Masa"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Masa")
                            : seciliOgeler.remove("Masa");
                      });
                    },
                  ),
                  CheckboxListTile(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      "Sandalye",
                      style: TextStyle(
                        color: Renkler.kahverengi,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: seciliOgeler.contains("Sandalye"),
                    onChanged: (bool? value) {
                      setState(() {
                        value!
                            ? seciliOgeler.add("Sandalye")
                            : seciliOgeler.remove("Sandalye");
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    debugPrint('$seciliOgeler');
                    if (seciliOgeler.contains('Masa') ||
                        seciliOgeler.contains('Sandalye')) {}
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Uygula",
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
    if (secimler.contains('Masa')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.turu == 'Masa') {
          yeniliste.add(urunler[i]);
        }
      }
    }
    if (secimler.contains('Sandalye')) {
      for (int i = 0; i < urunler.length; i++) {
        if (urunler[i].urun.turu == 'Sandalye') {
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
