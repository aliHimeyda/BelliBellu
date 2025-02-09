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
  List<String> seciliOgeler = [];
  String siralamaolcutu = "";
  List<Ozelurunkarti> urunler = [];
  Future<void> kartlariolustur() async {
    for (Urunler urun in Urunler.urunler) {
      Ozelurunkarti kart = await Ozelurunkarti(urun: urun);
      urunler.add(kart);
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await kartlariolustur();
      ;
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
                  _showMultiSelectDialog(context);
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

  void urunlerifilitrele(List<String> istenilenfilitre) {}
}
