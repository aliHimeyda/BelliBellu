import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Gecmissiparislersayfasi extends StatefulWidget {
  @override
  State<Gecmissiparislersayfasi> createState() =>
      _GecmissiparislersayfasiState();
}

class _GecmissiparislersayfasiState extends State<Gecmissiparislersayfasi> {
  TextEditingController _textcontroller = TextEditingController();
  List<bool> selectedlist = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        title: Text(
          S.of(context).baslik_siparislerim,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Renkler.kahverengi,
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              controller: _textcontroller,
              cursorColor: Renkler.kahverengi,
              decoration: InputDecoration(
                hintText: S.of(context).arama_ipucu,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                floatingLabelStyle: TextStyle(color: Renkler.kahverengi),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Renkler.kahverengi, width: 2.0),
                ),
              ),
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: 12),
          // Kategori Butonları
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 14,
              children: [
                FilterChip(
                  backgroundColor: Renkler.kuyubeyaz,
                  selectedColor: Renkler.krem,
                  label: Text(
                    S.of(context).filtre_tumu,
                    style: TextStyle(color: Renkler.kahverengi),
                  ),
                  selected: selectedlist[0],
                  onSelected: (_) {
                    setState(() {
                      selectedlist = [true, false, false];
                    });
                  },
                ),
                FilterChip(
                  backgroundColor: Renkler.kuyubeyaz,
                  selectedColor: Renkler.krem,
                  label: Text(
                    S.of(context).filtre_bu_ay,
                    style: TextStyle(color: Renkler.kahverengi),
                  ),
                  selected: selectedlist[1],
                  onSelected: (_) {
                    setState(() {
                      selectedlist = [false, true, false];
                    });
                  },
                ),
                FilterChip(
                  backgroundColor: Renkler.kuyubeyaz,
                  selectedColor: Renkler.krem,
                  label: Text(
                    S.of(context).filtre_gecen_ay,
                    style: TextStyle(color: Renkler.kahverengi),
                  ),
                  selected: selectedlist[2],
                  onSelected: (_) {
                    setState(() {
                      selectedlist = [false, false, true];
                    });
                  },
                ),
              ],
            ),
          ),

          // Arama Kutusu
          SizedBox(height: 12),

          // Sipariş Listesi
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                buildSiparisCard(
                  tarih: '24 Mart 2025',
                  toplam: '1088.91 TL',
                  urunler: ['📦', '🔌', '📘', '✏️'],
                ),
                buildSiparisCard(
                  tarih: '18 Mart 2025',
                  toplam: '651.90 TL',
                  urunler: ['✏️', '🧴', '🧴', '☀️'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _telefonPopup(BuildContext context) {
    final TextEditingController _telefonController = TextEditingController();
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 24,
          ),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return buildCard(
                children: [
                  Row(
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 8),
                      Text(
                        S.of(context).teslim_edildi,
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(S.of(context).teslimat_bilgisi('adet', 'tarih')),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text("${S.of(context).kargo_firmasi}: "),
                      Text(
                        "trendyol express",
                        style: TextStyle(color: Renkler.kahverengi),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        'assets/masalarresmi.png',
                        fit: BoxFit.contain,
                        width: 70,
                        height: 70,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "RADOON",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Dokunmatik Kalem Tüm Cihazlara Uyumlu"),
                            Text('${S.of(context).adet}:'),
                            Text(
                              "255 TL",
                              style: TextStyle(color: Renkler.kahverengi),
                            ),
                            SizedBox(height: 4),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                S.of(context).urun_degerlendir,
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Renkler.kahverengi,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget buildSiparisCard({
    required String tarih,
    required String toplam,
    required List<String> urunler,
  }) {
    return Card(
      color: Renkler.krem,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tarih, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(
              '${S.of(context).toplam}: $toplam',
              style: TextStyle(color: Renkler.kahverengi),
            ),
            SizedBox(height: 8),
            Row(
              children:
                  urunler
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(e, style: TextStyle(fontSize: 24)),
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  label: Text(
                    S.of(context).teslim_edildi,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Renkler.acikyesil,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    context.push(Paths.gecmissiparisdetaylari);
                  },
                  child: Text(
                    S.of(context).detaylar,
                    style: TextStyle(color: Renkler.kahverengi),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _telefonPopup(context);
                  },
                  child: Text(
                    S.of(context).degerlendir,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
