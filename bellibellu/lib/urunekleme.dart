import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarVT.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/urunlerVT.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Urunekleme extends StatefulWidget {
  const Urunekleme({super.key});

  @override
  State<Urunekleme> createState() => _UruneklemeState();
}

class _UruneklemeState extends State<Urunekleme> {
  late TextEditingController urunAdi = TextEditingController();
  late TextEditingController urunrengi = TextEditingController();
  late TextEditingController materyali = TextEditingController();
  late TextEditingController fiyat = TextEditingController();
  late TextEditingController garantisuresi = TextEditingController();
  late TextEditingController ortam = TextEditingController();
  late TextEditingController stokdurumu = TextEditingController();
  late TextEditingController genislik = TextEditingController();
  late TextEditingController uzunluk = TextEditingController();
  late TextEditingController agirlik = TextEditingController();
  late TextEditingController renk = TextEditingController();
  late bool issandalye = true;
  late bool suyadayaniklimi = false;
  late String? resimURL = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        title: Text(
          S.of(context).urunEkleme,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Renkler.kahverengi,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCard(
              children: [
                Center(
                  child: Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Renkler.krem, // Arka plan rengi (gri ton)
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        // Giriş Yap
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => issandalye = true),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color:
                                    issandalye
                                        ? Renkler.kahverengi
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    issandalye
                                        ? Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        )
                                        : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                S.of(context).sandalye,
                                style: TextStyle(
                                  color:
                                      issandalye ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Kayıt Ol
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => issandalye = false),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color:
                                    !issandalye
                                        ? Renkler.kahverengi
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    !issandalye
                                        ? Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        )
                                        : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                S.of(context).masa,
                                style: TextStyle(
                                  color:
                                      !issandalye ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(color: Renkler.kahverengi),
                buildRow(S.of(context).urunResmi, '', bold: true),
                SizedBox(height: 7),
                (resimURL == null)
                    ? GestureDetector(
                      onTap: () {
                        _resimSecVeYukle();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Renkler.krem,
                          border: Border.all(color: Renkler.kahverengi),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Renkler.kahverengi,
                          size: 35,
                        ),
                      ),
                    )
                    : Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Renkler.krem,
                        border: Border.all(color: Renkler.kahverengi),
                      ),
                      child: Image.network(resimURL!),
                    ),
                SizedBox(height: 7),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildCard(
              children: [
                buildRow(S.of(context).urun_ozellikleri, '', bold: true),
                Divider(color: Renkler.kahverengi),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: urunAdi,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: S.of(context).urunAdi,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: ortam,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: S.of(context).ortam,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: materyali,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: S.of(context).materyal,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: renk,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: S.of(context).renk,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: fiyat,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).fiyat}(TL)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: stokdurumu,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: S.of(context).stokDurumu,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: garantisuresi,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).garantiSuresi}(y.)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: agirlik,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).agirlik}(KG)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: uzunluk,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).uzunluk}(CM)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        controller: genislik,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: '${S.of(context).genislik}(CM)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildRow(
                      S.of(context).suyaDayanikliMi,
                      '',
                      bold: true,
                      color: Renkler.kahverengi,
                    ),
                    Checkbox(
                      activeColor: Renkler.kahverengi,
                      value: suyadayaniklimi,
                      onChanged: (value) {
                        setState(() {
                          suyadayaniklimi = value!;
                          debugPrint(suyadayaniklimi.toString());
                        });
                      },
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          urunekle();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Renkler.kahverengi,
                        ),
                        child: Text(
                          S.of(context).gonder,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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

  void _resimSecVeYukle() async {
    resimURL = await Urunlervt.resimYukleVeLinkAl();
    if (resimURL != null) {
      setState(() {
        resimURL;
      });
      print("Resim başarıyla yüklendi: $resimURL");
      // Bu URL'yi Image.network(resimURL) ile kullanabilirsin
    } else {
      print("Resim yüklenemedi.");
    }
  }

  void urunekle() async {
    final basarili = await Urunlervt.urunEkle(
      urunAdi: urunAdi.text,
      urunResmi: resimURL!,
      urunrengi: urunrengi.text,
      materyali: materyali.text,
      suyadayaniklimi: suyadayaniklimi ? 'evet' : 'hayir',
      fiyat: double.parse(fiyat.text),
      garantisuresi: garantisuresi.text,
      ortam: ortam.text,
      stokdurumu: int.parse(stokdurumu.text),
      genislik: double.parse(genislik.text),
      uzunluk: double.parse(uzunluk.text),
      agirlik: double.parse(agirlik.text),
      kullaniciID:
          Provider.of<Kullanicilarprovider>(
            context,
            listen: false,
          ).currentkullanici['kullaniciID'],
      sandalyemi: issandalye,
    );
    if (basarili) {
      Map<String, dynamic> urun = await Urunlervt.getUrunByAd(
        urunAdi.text,
        Provider.of<Kullanicilarprovider>(
          context,
          listen: false,
        ).currentkullanici['kullaniciID'].toString(),
      );
      kartiolustur(urun);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).islem_basarili,
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );

      context.pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).hataOlustu,
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    }
  }

  Future<void> kartiolustur(Map<String, dynamic> urun) async {
    Ozelurunkarti kart = Ozelurunkarti(urun: urun);

    Provider.of<Kullanicilarprovider>(
      context,
      listen: false,
    ).saticiurunleri.add(kart);
    Provider.of<Kullanicilarprovider>(
      context,
      listen: false,
    ).degisikliklerikaydet();
  }
}
