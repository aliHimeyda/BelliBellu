import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';

class Gecmissiparisdetaysayfasi extends StatelessWidget {
  const Gecmissiparisdetaysayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        backgroundColor: Renkler.kahverengi,
        title: Text(
          S.of(context).siparis_detayi,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          // Sipariş Bilgileri Kartı
          buildCard(
            children: [
              buildRow(S.of(context).siparis_no, "9877970828"),
              buildRow(S.of(context).siparis_tarihi, "19 Aralık 2024"),
              buildRow(
                S.of(context).siparis_ozeti,
                "1 Teslimat, 1 Ürün",
                color: Renkler.kahverengi,
              ),
              buildRow(
                S.of(context).siparis_detayi,
                "1 Ürün Teslim Edildi",
                color: Renkler.kahverengi,
              ),
              buildRow(
                S.of(context).toplam,
                "255 TL",
                valueColor: Renkler.kahverengi,
              ),
            ],
          ),

          // Tahmini Teslimat Kartı
          buildCard(
            children: [
              buildRow(S.of(context).tahmini_teslimat, "21 Aralık", bold: true),
              buildRow(S.of(context).teslimat_no, "9073246489"),
              SizedBox(height: 8),

              Text(
                "${S.of(context).satici} RADOON",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          // Ürün Bilgisi
          buildCard(
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
          ),

          // Teslimat Adresi
          buildCard(
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: Renkler.yesil),
                  SizedBox(width: 8),
                  Text(
                    S.of(context).teslimat_adresi,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text("${S.of(context).alici}: Ali HİMEYDA"),
              Text("İstiklal Mah. 407 Sk. No: 36/a Serdivan Sakarya"),
              Text("(DİRİLİŞ erkek öğrenci yurdu)"),
              Text("İstiklal Mah/Serdivan/Sakarya"),
              Text("537*****71"),
            ],
          ),

          // Ödeme Özeti
          buildCard(
            children: [
              Row(
                children: [
                  Icon(Icons.credit_card, color: Renkler.yesil),
                  SizedBox(width: 8),
                  Text(
                    S.of(context).odeme_bilgisi,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("  **** **** 8698 - Tek Çekim"),
                ],
              ),
              Divider(height: 20),
              buildRow(S.of(context).ara_toplam, "255 TL"),
              buildRow(S.of(context).kargo, "39.99 TL"),
              buildRow(S.of(context).kargo_bedava, "-39.99 TL"),
              Divider(),
              buildRow(
                S.of(context).toplam,
                "255 TL",
                valueColor: Renkler.kahverengi,
              ),
            ],
          ),

          // Ekstra Butonlar
          ListTile(
            leading: Icon(Icons.support_agent_outlined),
            title: Text(S.of(context).satici_iletisim),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text(S.of(context).fatura_goruntule),
            onTap: () {},
          ),
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
}
