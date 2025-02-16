import 'package:bellibellu/ceviri.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grock/grock.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Urunkartiicerigi extends StatefulWidget {
  final Urunler urun;
  final List<Serid> seridler;
  const Urunkartiicerigi({Key? key, required this.urun, required this.seridler})
    : super(key: key);

  @override
  State<Urunkartiicerigi> createState() => _UrunkartiicerigiState();
}

class _UrunkartiicerigiState extends State<Urunkartiicerigi>
    with AutomaticKeepAliveClientMixin {
  final List<Map<String, String>> soruCevaplar = [
    {
      "musteri": "A*** K***",
      "tarih": "10 Şubat 2020 | 23:29",
      "soru": "Merhaba, ürünün çeliği paslanmaz değil mi?",
      "cevap": "Evet efendim, paslanmaz çelikten üretilmiştir.",
    },
    {
      "musteri": "M*** D***",
      "tarih": "12 Mart 2021 | 14:45",
      "soru": "Bu ürün suya dayanıklı mı?",
      "cevap":
          "Evet, suya dayanıklıdır ancak uzun süre su altında tutmamanız önerilir.",
    },
    {
      "musteri": "Z*** Y***",
      "tarih": "5 Nisan 2022 | 09:30",
      "soru": "İndirim yapılıyor mu?",
      "cevap": "Şu an için özel bir indirim bulunmamaktadır.",
    },
    {
      "musteri": "A*** Ç***",
      "tarih": "23 Mayıs 2023 | 19:15",
      "soru": "Hangi kargo firması ile gönderiyorsunuz?",
      "cevap": "Aras Kargo ve Yurtiçi Kargo ile gönderim yapıyoruz.",
    },
    {
      "musteri": "F*** K***",
      "tarih": "8 Haziran 2022 | 11:10",
      "soru": "Ürün orijinal mi?",
      "cevap": "Evet, ürün %100 orijinal ve üretici garantilidir.",
    },
    {
      "musteri": "E*** Ş***",
      "tarih": "2 Temmuz 2021 | 16:00",
      "soru": "Bu ürün hangi malzemeden üretilmiştir?",
      "cevap": "Ürün paslanmaz çelikten üretilmiştir.",
    },
    {
      "musteri": "C*** E***",
      "tarih": "15 Ağustos 2020 | 21:40",
      "soru": "Fiyatına kargo dahil mi?",
      "cevap": "Hayır, kargo ücreti fiyatımıza dahil değildir.",
    },
    {
      "musteri": "D*** T***",
      "tarih": "3 Eylül 2019 | 07:20",
      "soru": "Ürünün küçük boyutu var mı?",
      "cevap": "Evet, küçük boyutlu seçeneklerimiz de mevcuttur.",
    },
    {
      "musteri": "H*** A***",
      "tarih": "20 Ekim 2022 | 13:05",
      "soru": "Bu modelin farklı renkleri var mı?",
      "cevap":
          "Evet, bu modelin kırmızı, mavi ve siyah renkleri bulunmaktadır.",
    },
    {
      "musteri": "M*** G***",
      "tarih": "18 Kasım 2021 | 18:50",
      "soru": "Ürünün garantisi var mı?",
      "cevap": "Evet, ürün 2 yıl garantilidir.",
    },
    {
      "musteri": "A*** C***",
      "tarih": "1 Ocak 2020 | 12:00",
      "soru": "Bu ürün kaç günde teslim edilir?",
      "cevap": "3 iş günü içinde teslim edilir.",
    },
    {
      "musteri": "H*** E***",
      "tarih": "7 Şubat 2023 | 17:25",
      "soru": "Ürünün içeriği sağlığa zararlı mı?",
      "cevap": "Hayır, tamamen doğal ve sağlığa zararsızdır.",
    },
    {
      "musteri": "Y*** Ç***",
      "tarih": "25 Nisan 2021 | 08:30",
      "soru": "Ürün rengi soluyor mu?",
      "cevap": "Hayır, ürün uzun süre renk korumasına sahiptir.",
    },
    {
      "musteri": "C*** A***",
      "tarih": "13 Temmuz 2022 | 15:10",
      "soru": "Kırık ürün çıkarsa iade alıyor musunuz?",
      "cevap": "Evet, kırık veya hasarlı ürünlerde ücretsiz değişim yapıyoruz.",
    },
    {
      "musteri": "K*** B***",
      "tarih": "30 Kasım 2020 | 10:45",
      "soru": "Bu ürünü hediye paketi yapabilir misiniz?",
      "cevap": "Evet, sipariş sırasında hediye paketi seçeneği mevcuttur.",
    },
    {
      "musteri": "E*** Y***",
      "tarih": "5 Mart 2019 | 09:00",
      "soru": "Ürün kutulu mu geliyor?",
      "cevap": "Evet, orijinal kutusunda gönderilmektedir.",
    },
    {
      "musteri": "S*** A***",
      "tarih": "12 Nisan 2021 | 18:20",
      "soru": "Ürünün ölçüleri nedir?",
      "cevap": "Ürün açıklamalarında detaylı ölçü bilgisi mevcuttur.",
    },
    {
      "musteri": "B*** A***",
      "tarih": "18 Haziran 2022 | 20:15",
      "soru": "Kırılır mı?",
      "cevap": "Ürün dayanıklıdır, ancak düşmelere karşı dikkatli olunmalıdır.",
    },
    {
      "musteri": "G*** T***",
      "tarih": "27 Eylül 2021 | 14:10",
      "soru": "Montaj gerektiriyor mu?",
      "cevap": "Hayır, montaj gerektirmeyen bir üründür.",
    },
    {
      "musteri": "S*** D***",
      "tarih": "6 Kasım 2023 | 10:40",
      "soru": "Geri iade süresi kaç gün?",
      "cevap": "14 gün içinde iade hakkınız bulunmaktadır.",
    },
    {
      "musteri": "A*** A***",
      "tarih": "21 Aralık 2019 | 08:30",
      "soru": "Ürünün parçaları eksik geldi, ne yapmalıyım?",
      "cevap": "Müşteri hizmetlerimizle iletişime geçebilirsiniz.",
    },
    {
      "musteri": "E*** K***",
      "tarih": "10 Ocak 2022 | 16:50",
      "soru": "Ürün ses çıkarıyor mu?",
      "cevap": "Hayır, sessiz çalışan bir üründür.",
    },
    {
      "musteri": "N*** K***",
      "tarih": "29 Mayıs 2020 | 22:10",
      "soru": "Kargo ücreti ne kadar?",
      "cevap": "Kargo ücreti sipariş tutarına göre değişmektedir.",
    },
    {
      "musteri": "B*** Y***",
      "tarih": "14 Temmuz 2021 | 13:25",
      "soru": "Ürünün iç malzemesi nedir?",
      "cevap": "Ürün plastik ve metal karışımıdır.",
    },
    {
      "musteri": "S*** K***",
      "tarih": "9 Eylül 2022 | 19:05",
      "soru": "Bu ürün çocuklar için uygun mu?",
      "cevap": "Evet, 3 yaş ve üzeri çocuklar için uygundur.",
    },
    {
      "musteri": "V*** U***",
      "tarih": "22 Kasım 2023 | 11:40",
      "soru": "Şarjlı mı çalışıyor?",
      "cevap": "Evet, USB şarj ile çalışmaktadır.",
    },
    {
      "musteri": "G*** E***",
      "tarih": "3 Ocak 2024 | 20:15",
      "soru": "Ürün hafif mi?",
      "cevap": "Evet, oldukça hafif ve taşınabilir bir üründür.",
    },
    {
      "musteri": "M*** C***",
      "tarih": "15 Şubat 2021 | 14:50",
      "soru": "Kargo süresi kaç gün?",
      "cevap": "Yoğunluğa göre 3-5 iş günü sürebilmektedir.",
    },
  ];
  @override
  bool get wantKeepAlive => true;
  final List<Serid> seridler = [
    Serid(S.current.yeniurunler, 9),
    Serid(S.current.urunSerisi2025, 9),
    Serid(S.current.begenebilecegin, 9),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int uzunluk = 100 + random.nextInt(201);
    int genislik = 50 + random.nextInt(151);
    super.build(context); // Bu satır önemli
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 241, 241, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: ListView(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 10,
                          height: 350,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 3,
                              ),
                            ),
                          ),
                          child: Image.network(
                            widget.urun.resimYolu,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 25,
                                right: 25,
                                top: 0,
                                bottom: 5,
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      widget.urun.urunAdi,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    S
                                        .of(context)
                                        .urun_aciklamasi(
                                          widget.urun.urunAdi,
                                          Cevirici.malzemeCevir(
                                            context,
                                            widget.urun.materyali,
                                          ),
                                          Cevirici.turCevir(
                                            context,
                                            widget.urun.turu,
                                          ),
                                          Cevirici.ortamCevir(
                                            context,
                                            widget.urun.ortami,
                                          ),
                                          uzunluk,
                                          genislik,
                                        ),
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 20),
                        KisacaOzellikler(context),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            S.of(context).sik_sorulanlar,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        sorucevaplar(context),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            S.of(context).kategoriler,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        katagorilerseridi(context),

                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            S.of(context).urun_ozellikleri,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        KisacaOzellikler(context),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Renkler.kahverengi,
                              size: 6,
                            ),
                            SizedBox(width: 5),
                            Text(
                              S.of(context).bu_urun_turkiyede_uretilmistir,
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Renkler.kahverengi,
                              size: 6,
                            ),
                            SizedBox(width: 5),
                            Text(
                              S.of(context).urunlerin_garanti_suresi,
                              style: TextStyle(
                                color: Renkler.kahverengi,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 5),
                        Text(
                          S
                              .of(context)
                              .urun_aciklamasi(
                                widget.urun.urunAdi,
                                widget.urun.materyali,
                                widget.urun.turu,
                                widget.urun.ortami,
                                uzunluk,
                                genislik,
                              ),
                          style: TextStyle(
                            color: Renkler.kahverengi,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            debugPrint('tiklandi');
                            popup(uzunluk, genislik);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 198, 211, 187),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(S.of(context).tum_ozellikler),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ozelkapakliserid(
                          context,
                          S.of(context).begenebilecegin,
                        ),
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),

                        seridler[0],
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                        seridler[1],
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Renkler.kahverengi,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await urunlerigetir(
                              '${Cevirici.malzemeCevir(context, widget.urun.materyali)}',
                              context,
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 5,
                            height: 65,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(
                                width: 0.5,
                                color: Renkler.kahverengi,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S
                                      .of(context)
                                      .daha_fazla_materyal(
                                        Cevirici.malzemeCevir(
                                          context,
                                          widget.urun.materyali,
                                        ),
                                      ),
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
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
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await urunlerigetir(
                              '${Cevirici.ortamCevir(context, widget.urun.ortami)}',
                              context,
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 5,
                            height: 65,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(
                                width: 0.5,
                                color: Renkler.kahverengi,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S
                                      .of(context)
                                      .daha_fazla_materyal(
                                        Cevirici.ortamCevir(
                                          context,
                                          widget.urun.ortami,
                                        ),
                                      ),
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
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
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await urunlerigetir(
                              '${Cevirici.turCevir(context, widget.urun.turu)}',
                              context,
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 5,
                            height: 65,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              border: Border.all(
                                width: 0.5,
                                color: Renkler.kahverengi,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S
                                      .of(context)
                                      .daha_fazla_materyal(
                                        Cevirici.turCevir(
                                          context,
                                          widget.urun.turu,
                                        ),
                                      ),
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          favoriteIcon(),
          bottomnavigation(context),
        ],
      ),
    );
  }

  Center ozelkapakliserid(BuildContext context, String vasif) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 5,
        height: 360,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 182, 205, 162),
          borderRadius: BorderRadius.circular(10),
        ),
        child: seridler[2],
      ),
    );
  }

  SingleChildScrollView katagorilerseridi(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              spacing: 0,
              children: [
                GestureDetector(
                  onTap: () async {
                    debugPrint('tiklandi');
                    final routeName = GoRouterState.of(context).name;
                    debugPrint("Şu anki route: $routeName");
                    debugPrint(
                      'su anki route urisi : ${GoRouterState.of(context).uri.toString()}',
                    );
                    Navigator.pop(context);

                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
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
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    GoRouter.of(
                      context,
                    ).push('/tumurunler'); // Sayfaya nesneyi geçir)
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    await urunlerigetir(S.of(context).metal, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    await urunlerigetir(S.of(context).ahsap, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    await urunlerigetir(S.of(context).masa, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    await urunlerigetir(S.of(context).sandalye, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    await urunlerigetir(S.of(context).ev, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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
                    Navigator.pop(context);
                    await urunlerigetir(S.of(context).ofis, context);
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) - 10,
                    height: (MediaQuery.of(context).size.width / 3) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 3) - 50,
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
                              fontSize: 10,
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

  Future popup(uzunluk, genislik) => showDialog(
    context: context,

    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Renkler.kahverengi, width: 1),
          ),
          backgroundColor: Renkler.krem,
          shadowColor: Renkler.kahverengi,
          titlePadding: EdgeInsets.only(top: 0),

          // title: Text(
          //   'Urun Ozellikleri',
          //   style: TextStyle(
          //     color: Renkler.kahverengi,
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 380,

            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: ListView(
                    children: [
                      Wrap(
                        runSpacing: 10,
                        spacing: 10,
                        children: [
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).agirlik,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${widget.urun.agirligi}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).materyal,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Cevirici.malzemeCevir(context, widget.urun.materyali)}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).ortam,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Cevirici.ortamCevir(context, widget.urun.ortami)}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).tur,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${Cevirici.turCevir(context, widget.urun.turu)}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromRGBO(245, 241, 241, 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).ad,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${widget.urun.urunAdi}',
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Text(
                        '_${S.of(context).bu_urun_turkiyede_uretilmistir}',
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 12,
                        ),
                      ),

                      Text(
                        '_${S.of(context).urunlerin_garanti_suresi}',
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 12,
                        ),
                      ),

                      SizedBox(width: 5),
                      Text(
                        S
                            .of(context)
                            .urun_aciklamasi(
                              widget.urun.urunAdi,
                              widget.urun.materyali,
                              widget.urun.turu,
                              widget.urun.ortami,
                              uzunluk,
                              genislik,
                            ),
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).ad} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.urun.urunAdi,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).agirlik} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.urun.agirligi,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).materyal} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Cevirici.malzemeCevir(
                              context,
                              widget.urun.materyali,
                            ),
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).ortam} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Cevirici.ortamCevir(context, widget.urun.ortami),
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).tur} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Cevirici.turCevir(context, widget.urun.turu),
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${S.of(context).garanti_suresi} :',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1 y.',
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 3,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Renkler.kahverengi),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          debugPrint('${widget.urun.urunAdi} tiklandi');
                          widget.urun.begenilmismi
                              ? widget.urun.begenilmismi = false
                              : widget.urun.begenilmismi = true;
                          setState(() {
                            if (widget.urun.begenilmismi) {
                              widget.colored(color: Renkler.kirmizi);
                              begenilenekaydet(widget.urun.urunAdi);
                            } else {
                              widget.colored(color: Colors.white);
                              begenilendensil(widget.urun.urunAdi);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color:
                              widget.urun.begenilmismi
                                  ? Renkler.kirmizi
                                  : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 3,
                  child: Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Renkler.kahverengi),
                    ),
                    child: Center(
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context); // Popup'ı kapatır
                        },
                        icon: Icon(
                          Icons.close,
                          color: Renkler.kahverengi,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );

  SingleChildScrollView sorucevaplar(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: 8, top: 30),
        child: Wrap(
          spacing: 10,
          children: [
            for (Map<String, String> s in soruCevaplar)
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.6, color: Renkler.kahverengi),
                  color: const Color.fromARGB(255, 198, 211, 187),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            s['musteri']!,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            s['tarih']!,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          s['soru']!,
                          style: TextStyle(
                            color: Renkler.kahverengi,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2 - 50,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Renkler.krem,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Ali HIMEYDA',
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                s['cevap']!,
                                style: TextStyle(
                                  color: Renkler.kahverengi,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Wrap KisacaOzellikler(context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 10,
      children: [
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).agirlik,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.urun.agirligi}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).materyal,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Cevirici.malzemeCevir(context, widget.urun.materyali)}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).ortam,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Cevirici.ortamCevir(context, widget.urun.ortami)}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).tur,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Cevirici.turCevir(context, widget.urun.turu)}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),

        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Renkler.krem,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).ad,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${widget.urun.urunAdi}',
                  style: TextStyle(color: Renkler.kahverengi, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Positioned favoriteIcon() {
    return Positioned(
      top: 35,
      right: 10,
      child: Container(
        width: 27,
        height: 27,
        decoration: BoxDecoration(
          color: Renkler.krem,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Renkler.kahverengi),
        ),
        child: Center(
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              debugPrint('${widget.urun.urunAdi} tiklandi');
              widget.urun.begenilmismi
                  ? widget.urun.begenilmismi = false
                  : widget.urun.begenilmismi = true;
              setState(() {
                if (widget.urun.begenilmismi) {
                  widget.colored(color: Renkler.kirmizi);
                  begenilenekaydet(widget.urun.urunAdi);
                } else {
                  widget.colored(color: Colors.white);
                  begenilendensil(widget.urun.urunAdi);
                }
              });
            },
            icon: Icon(
              Icons.favorite,
              color: widget.urun.begenilmismi ? Renkler.kirmizi : Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Positioned bottomnavigation(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(color: Renkler.kuyubeyaz),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite, color: Renkler.kahverengi, size: 20),
                  Text(
                    '${widget.urun.begenisayisi}',
                    style: TextStyle(fontSize: 15, color: Renkler.kahverengi),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  await sendSMS();
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Renkler.kahverengi,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      S.of(context).iletisim,
                      style: TextStyle(
                        color: Renkler.krem,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '${widget.urun.urunfiyati}TL',
                style: TextStyle(fontSize: 15, color: Renkler.kahverengi),
              ),
            ],
          ),
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

  Future<void> sendSMS() async {
    final Uri whatsappUri = Uri.parse(
      "whatsapp://send?phone=905372943871&text=*${widget.urun.urunAdi}* kodlu *${widget.urun.materyali}* *${widget.urun.turu}* hakkinda soru sormak istiyordum",
    );

    try {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("WhatsApp açılamadı! Hata: $e")));
    }
  }
}
