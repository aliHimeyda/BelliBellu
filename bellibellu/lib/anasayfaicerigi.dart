import 'package:bellibellu/bellekislemleri.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/tumurunler.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Anasayfaicerigi extends StatefulWidget {
  const Anasayfaicerigi({super.key});

  @override
  State<Anasayfaicerigi> createState() => _AnasayfaicerigiState();
}

class _AnasayfaicerigiState extends State<Anasayfaicerigi> {
  TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> aramaonerileri = [
    'masa',
    'sandalye',
    'ev mobilyası',
    'ofis mobilyası',
    'metal masa',
    'metal sandalye',
    'ahşap ürünler',
    'kafe mobilyası',
  ];
  List<String> filitrelenenkelimeler = []; // Filtrelenen kelimeler

  ValueNotifier<List<String>> filteredWords = ValueNotifier<List<String>>([]);

  void oneribul(String query) {
    if (query.isEmpty) {
      filteredWords.value = [];
    } else {
      filteredWords.value =
          aramaonerileri
              .where((word) => word.toLowerCase().contains(query.toLowerCase()))
              .toList();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    filteredWords.dispose();
    super.dispose();
  }

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
            GoRouter.of(context).push('/tumurunler'); // Sayfaya nesneyi geçir)
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
          onTap: () async {
            await urunlerigetir('masa', context);
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
          onTap: () async {
            await urunlerigetir('sandalye', context);
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
          onTap: () async {
            await urunlerigetir('ofis', context);
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
          onTap: () async {
            await urunlerigetir('ev', context);
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
                        controller: _controller,
                        focusNode: _focusNode,
                        cursorColor: Renkler.bordo,
                        onChanged: oneribul,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Renkler.kahverengi,
                              size: 17,
                            ),
                            onPressed: () async {
                              await urunlerigetir(_controller.text, context);
                            },
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
                  onTap: () async {
                    await urunlerigetir('masa', context);
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
                  onTap: () async {
                    await urunlerigetir('sandalye', context);
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
                  onTap: () async {
                    await urunlerigetir('ev', context);
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
                  onTap: () async {
                    await urunlerigetir('ofis', context);
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
                  onTap: () async {
                    await urunlerigetir('kafe', context);
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
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
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
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
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
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
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

        Expanded(
          child: ValueListenableBuilder<List<String>>(
            valueListenable: filteredWords,
            builder: (context, suggestions, child) {
              return suggestions.isNotEmpty
                  ? GestureDetector(
                    onTap: () {
                      _controller.text = '';
                      _focusNode.unfocus();
                      oneribul(''); // Listeyi temizle
                    },
                    child: ListView.builder(
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            _controller.text = suggestions[index];
                            await urunlerigetir(_controller.text, context);
                            _controller.text = '';
                            _focusNode.unfocus();

                            oneribul(''); // Listeyi temizle
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Text(
                              suggestions[index],
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                  : SizedBox();
            },
          ),
        ),
      ],
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
            urun.materyali.toLowerCase().contains(kelime) ||
            urun.ortami.toLowerCase().contains(kelime) ||
            urun.turu.toLowerCase().contains(kelime))) {
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
