import 'package:bellibellu/bellekislemleri.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfaicerigi extends StatefulWidget {
  const Anasayfaicerigi({super.key});

  @override
  State<Anasayfaicerigi> createState() => _AnasayfaicerigiState();
}

class _AnasayfaicerigiState extends State<Anasayfaicerigi> {
  @override
  void initState() {
    _bellekguncelle;
    super.initState();
  }

  Future<void> _bellekguncelle() async {
    await Hafizaislemleri.bellektekiUrunleriGuncelle();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor:
            Renkler.kahverengi, // 🔥 Status bar rengini kahverengi yap
        statusBarIconBrightness: Brightness.light, // 🔥 İkonları beyaz yap
      ),
      child: Scaffold(
        backgroundColor: Renkler.kuyubeyaz,
        body: Stack(
          children: [
            ListView(
              addAutomaticKeepAlives:
                  false, // 🔥 Yeniden oluşturulmasını engeller
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Yatay kaydırmayı aktif et

                  child: Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: Wrap(
                      spacing: 15,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 10,
                          height: 190,
                          decoration: BoxDecoration(
                            color: Renkler.kuyubeyaz,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/slider1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Renkler.kuyubeyaz,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width:
                              MediaQuery.of(context).size.width -
                              10, //ekran genisligi kadar
                          height: 190,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/slider2.png',

                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Renkler.kuyubeyaz,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: MediaQuery.of(context).size.width - 10,
                          height: 190,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/slider3.png',

                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Serid('2025 Urunlari', 15),
                    Serid('En Cok Favorilenen', 20),
                    Serid('Ofis Mobilya Urunleri', 10),
                    Serid('Ev Urunleri', 9),
                    yildizlikatagoriler(context),
                  ],
                ),
              ],
            ),
            aramaMetodu(context),
          ],
        ),
      ),
    );
  }

  Column yildizlikatagoriler(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            debugPrint('tiklandi');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(
              top: 15,
              left: 5,
              right: 5,
              bottom: 1,
            ),
            child: Image.asset(
              'assets/yildizliurunlerresmi.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('tiklandi');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset('assets/masalarresmi.png', fit: BoxFit.contain),
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('tiklandi');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset('assets/sandalyeresmi.png', fit: BoxFit.contain),
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('tiklandi');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset('assets/ofisresmi.png', fit: BoxFit.contain),
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint('tiklandi');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset('assets/evresmi.png', fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }

  Column aramaMetodu(context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            color: Renkler.kahverengi,
            child: Row(
              children: [
                Positioned(
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 35,
                      child: TextField(
                        cursorColor: Renkler.bordo,
                        onChanged: (value) {
                          // Arama işlemleri burada yazılacak
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Renkler.kahverengi,
                              size: 17,
                            ),
                            onPressed: () {},
                          ),
                          hintText: 'Magazada Arayin',
                          focusColor: Renkler.kahverengi,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          filled: true,
                          fillColor: Renkler.kuyubeyaz,
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    
                    debugPrint('tiklandi');
                  },
                  icon: const Icon(Icons.email, color: Renkler.kuyubeyaz),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Renkler.krem,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'masa',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'sandalye',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'ev',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'ofis',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'kafe',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 110,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'en cok begenilenler',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 110,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                '2025 uretimi',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                  },
                  child: Positioned(
                    top: 33,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 10,
                        top: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 110,
                            height: 22,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'efsane urunler',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
      ],
    );
  }
}
