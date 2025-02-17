import 'package:bellibellu/ceviri.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Katagoriler extends StatelessWidget {
  const Katagoriler({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
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
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
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
                              fontSize: 15,
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

  Future<void> urunlerigetir(String aranan, context) async {
    debugPrint('urunlerigetir metoduna gelen kelime : $aranan');

    List<Urunler> bulunanurunler = [];
    List<String> kelimeler = aranan.toLowerCase().split(
      " ",
    ); // Kullanıcının girdiği kelimeleri parçala.

    for (Urunler urun in Urunler.urunler) {
      bool tumKelimelerEslesiyor =
          true; // Tüm kelimeleri içerip içermediğini kontrol edeceğiz.

      for (String kelime in kelimeler) {
        if (!(urun.urunAdi.toLowerCase().contains(kelime) ||
            Cevirici.malzemeCevir(
              context,
              urun.materyali,
            ).toLowerCase().contains(kelime) ||
            Cevirici.ortamCevir(
              context,
              urun.ortami,
            ).toLowerCase().contains(kelime) ||
            Cevirici.turCevir(
              context,
              urun.turu,
            ).toLowerCase().contains(kelime))) {
          tumKelimelerEslesiyor =
              false; // Eğer bir kelime bile eşleşmezse, ürünü eklemeyiz.
          break;
        }
      }

      if (tumKelimelerEslesiyor) {
        bulunanurunler.add(urun);
      }
    }

    if (bulunanurunler.isNotEmpty) {
      GoRouter.of(context).push('/ozelurunler', extra: bulunanurunler);
    } else {
      debugPrint("Eşleşen ürün bulunamadı.");
    }
  }
}
