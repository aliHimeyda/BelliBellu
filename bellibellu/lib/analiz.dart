import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class AnalizSayfasi extends StatefulWidget {
  const AnalizSayfasi({super.key});

  @override
  State<AnalizSayfasi> createState() => _AnalizSayfasiState();
}

class _AnalizSayfasiState extends State<AnalizSayfasi> {
  late Map<String, dynamic>? faaliyetbilgisi = {};
  late List<int> aylikSatislar = [34324, 34342, 222, 2241, 24335, 3435];
  late List<Map<String, dynamic>> enCokSatilanUrun = [];
  late List<Map<String, dynamic>> enCokBegenilenUrun = [];
  late Future<void> urunlerigetir;
  @override
  void initState() {
    super.initState();
    urunlerigetir = Urunlerigetir();
    Future.delayed(Duration.zero, () async {
      await Urunlerigetir();
    });
  }

  Future<void> Urunlerigetir() async {
    enCokBegenilenUrun = await Urunlervt.getbelirliUrunlerim(
      1,
      [],
      [],
      [],
      [],
      'encokbegenilen',
      '',
      '',
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
    );
    enCokSatilanUrun = await Urunlervt.getbelirliUrunlerim(
      1,
      [],
      [],
      [],
      [],
      'encoksatilan',
      '',
      '',
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
    );
    faaliyetbilgisi = await Urunlervt.getSaticiFaaliyetBilgileri(
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        backgroundColor: Renkler.krem,
        title: Text(
          S.of(context).analiz,
          style: TextStyle(
            color: Renkler.kahverengi,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: urunlerigetir,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Renkler.kahverengi),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return buildCard(
                  children: [
                    buildRow(
                      S.of(context).enSonFaaliyetBilgileri,
                      '',
                      bold: true,
                    ),
                    Divider(color: Renkler.kahverengi),
                    buildRow(
                      S.of(context).toplamSatisMiktari,
                      '${faaliyetbilgisi!['toplamsatismiktari'].toString()} TL',
                      bold: true,
                      color: Renkler.kahverengi,
                    ),
                    buildRow(
                      S.of(context).toplamSatisSayisi,
                      faaliyetbilgisi!['toplamsatilmasayisi'].toString(),
                      bold: true,
                      color: Renkler.kahverengi,
                    ),
                    buildRow(
                      S.of(context).yayinlananUrunSayisi,
                      faaliyetbilgisi!['yayinlananurunsayisi'].toString(),
                      bold: true,
                      color: Renkler.kahverengi,
                    ),
                    buildRow(
                      S.of(context).begeniSayisi,
                      faaliyetbilgisi!['toplamurunbegenisayisi'].toString(),
                      bold: true,
                      color: Renkler.kahverengi,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: urunBilgiWidget(
                        enCokSatilanUrun[0],
                        S.of(context).enCokSatilanUrun,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: urunBilgiWidget(
                        enCokBegenilenUrun[0],
                        S.of(context).enCokBegenilenUrun,
                      ),
                    ),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget toplamSatisGrafik(List<int> aylikSatislar) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Toplam Satış Miktarı",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: List.generate(
                aylikSatislar.length,
                (index) => BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: aylikSatislar[index].toDouble(),
                      width: 16,
                    ),
                  ],
                ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget:
                        (value, meta) => Text("Ay ${(value + 1).toInt()}"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget urunBilgiWidget(Map<String, dynamic> urun, String baslik) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        buildCard(
          children: [
            buildRow(baslik, '', bold: true),
            Divider(color: Renkler.kahverengi),
            SizedBox(height: 8),
            Row(
              children: [
                Image.network(
                  urun['urunResmi'],
                  fit: BoxFit.cover,
                  width: 170,
                  height: 170,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildRow(
                        S.of(context).ad,
                        urun['urunAdi'],
                        valueColor: Renkler.kahverengi,
                      ),
                      buildRow(
                        S.of(context).fiyat,
                        '${urun['fiyat'].toString()} TL',
                        valueColor: Renkler.kahverengi,
                      ),
                      buildRow(
                        S.of(context).satilmaSayisi,
                        urun['satilmaSayisi'].toString(),
                        valueColor: Renkler.kahverengi,
                      ),
                      buildRow(
                        S.of(context).begeniSayisi,
                        urun['begeniSayisi'].toString(),
                        valueColor: Renkler.kahverengi,
                      ),
                      SizedBox(height: 4),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            ' guncelle',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Renkler.kahverengi,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildRow(
    String label,
    String value, {
    bool bold = false,
    Color? color,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: bold ? TextStyle(fontWeight: FontWeight.bold) : null,
          ),
          Text(value, style: TextStyle(color: valueColor ?? color)),
        ],
      ),
    );
  }

  Widget buildCard({required List<Widget> children}) {
    return Card(
      color: Renkler.krem,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: children),
      ),
    );
  }
}
