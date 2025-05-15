import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';

class SohbetIcerigiSayfasi extends StatelessWidget {
  const SohbetIcerigiSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'VPBİLİŞİM',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Teslimat Durumu',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Renkler.kahverengi,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                "22 Eylül 2023",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(12),
              children: [
                // Kullanıcı mesajları
                buildUserMessage(
                  "Siparişim ne zaman kargoya verilecek? Dün sipariş verdim, en geç yarın kargoda yazılmıştı",
                  "16:06",
                ),
                buildUserMessage(
                  "Kargoya verildiğinde bilgilendirme alacak mıyım?",
                  "16:08",
                ),

                // Satıcı mesajları
                buildSellerMessage("Birazdan kargoya verilecek", "16:07"),
                buildSellerMessage(
                  "Evet, sistem otomatik bildirim gönderir.",
                  "16:09",
                ),
              ],
            ),
          ),

          // Mesaj Yazma Kutusu
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
              color: Renkler.krem,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: Renkler.kahverengi,
                    decoration: InputDecoration(
                      focusColor: Renkler.kahverengi,
                      fillColor: Renkler.kahverengi,
                      hintText: S.of(context).mesaj_yazin,
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Renkler.kahverengi),
                      floatingLabelStyle: TextStyle(color: Renkler.kahverengi),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Renkler.kahverengi),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserMessage(String text, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 165, 130, 58),
                  Renkler.kahverengi,
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(bottom: 4),
            child: Text(text, style: TextStyle(color: Colors.white)),
          ),
          Text(time, style: TextStyle(fontSize: 10, color: Renkler.kahverengi)),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget buildSellerMessage(String text, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Renkler.krem,
            child: Text(
              "VP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Renkler.kahverengi,
              ),
            ),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Renkler.krem,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 4),
                child: Text(text),
              ),
              Text(
                time,
                style: TextStyle(fontSize: 10, color: Renkler.kahverengi),
              ),
              SizedBox(height: 12),
            ],
          ),
        ],
      ),
    );
  }
}
