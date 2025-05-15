import 'package:bellibellu/bellekislemleri.dart';
import 'package:bellibellu/ceviri.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Anasayfaicerigi extends StatefulWidget {
  const Anasayfaicerigi({super.key});

  @override
  State<Anasayfaicerigi> createState() => _AnasayfaicerigiState();
}

class _AnasayfaicerigiState extends State<Anasayfaicerigi> {
  TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> aramaonerileri = [
    S.current.masaonerisi,
    S.current.sandalyeonerisi,
    S.current.metalmasaonerisi,
    S.current.metalsandalyeonerisi,
    S.current.ofisMobilyalarionerisi,
    S.current.evMobilyaUrunlerionerisi,
    S.current.kafeurunlerionerisi,
    S.current.kafeurunlerionerisi,
  ];
  List<String> filitrelenenkelimeler = []; // Filtrelenen kelimeler

  ValueNotifier<List<String>> filteredWords = ValueNotifier<List<String>>([]);

  void oneribul(String query) {
    List<String> aramaonerileri = [
      S.current.masaonerisi,
      S.current.sandalyeonerisi,
      S.current.metalmasaonerisi,
      S.current.metalsandalyeonerisi,
      S.current.ofisMobilyalarionerisi,
      S.current.evMobilyaUrunlerionerisi,
      S.current.kafeurunlerionerisi,
      S.current.kafeurunlerionerisi,
    ];
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
                            color: const Color(0xFF2e5d36),
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
                            color: const Color(0xFF2e5d36),
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
                            color: const Color(0xFF2e5d36),
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
                    Serid(S.of(context).urunSerisi2025, 15),
                    Serid(S.of(context).efsaneUrunler, 20),
                    Serid(S.of(context).ofisMobilyalari, 10),
                    Serid(S.of(context).evUrunleri, 9),
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
            color: Renkler.krem,
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
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await urunlerigetir('masa', context);
            debugPrint('tiklandi');
          },
          child: Container(
            color: const Color(0xFF2e5d36),
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset(
              'assets/masalarresmi.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await urunlerigetir('sandalye', context);
            debugPrint('tiklandi');
          },
          child: Container(
            color: const Color.fromARGB(255, 128, 70, 3),
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset(
              'assets/sandalyeresmi.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await urunlerigetir('ofis', context);
            debugPrint('tiklandi');
          },
          child: Container(
            color: Renkler.koyuMavi,
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset(
              'assets/ofisresmi.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await urunlerigetir('ev', context);
            debugPrint('tiklandi');
          },
          child: Container(
            color: Renkler.bordo,
            width: MediaQuery.of(context).size.width,
            height: 145,
            margin: const EdgeInsets.only(top: 1, left: 5, right: 5, bottom: 1),
            child: Image.asset(
              'assets/evresmi.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
      ],
    );
  }

  Column aramaMetodu(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Container(
            color: Renkler.kahverengi,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          hintText: S.of(context).aramaIpucu,
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
                  onPressed: () {
                    context.push(Paths.sohbetlersayfasi);
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
                    await urunlerigetir(S.of(context).masa, context);
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
                            child: Center(
                              child: Text(
                                S.of(context).masa,
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
                    await urunlerigetir(S.of(context).sandalye, context);
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
                            child: Center(
                              child: Text(
                                S.of(context).sandalye,
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
                    await urunlerigetir(S.of(context).ev, context);
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
                            child: Center(
                              child: Text(
                                S.of(context).ev,
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
                    await urunlerigetir(S.of(context).ofis, context);
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
                            child: Center(
                              child: Text(
                                S.of(context).ofis,
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
                    await urunlerigetir(S.of(context).kafe, context);
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
                            child: Center(
                              child: Text(
                                S.of(context).kafe,
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
                            child: Center(
                              child: Text(
                                S.of(context).enCokBegenilenler,
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
                            child: Center(
                              child: Text(
                                S.of(context).urunSerisi2025,
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
                            child: Center(
                              child: Text(
                                S.of(context).efsaneUrunler,
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
