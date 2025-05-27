import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/siparislerprovider.dart';
import 'package:bellibellu/services/siparislervt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Gecmissiparisdetaysayfasi extends StatefulWidget {
  final int faturaID;
  const Gecmissiparisdetaysayfasi({super.key, required this.faturaID});

  @override
  State<Gecmissiparisdetaysayfasi> createState() =>
      _GecmissiparisdetaysayfasiState();
}

class _GecmissiparisdetaysayfasiState extends State<Gecmissiparisdetaysayfasi> {
  late Future<void> faturadetayi;
  @override
  void initState() {
    super.initState();
    faturadetayi = faturadetayigetir();
    debugPrint('gelen fatura ID :====>${widget.faturaID.toString()}');
  }

  Future<void> faturadetayigetir() async {
    Provider.of<Siparislerprovider>(
      context,
      listen: false,
    ).faturadetayi = await Siparislervt.faturadetayigetir(widget.faturaID);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Renkler.kuyubeyaz,
          appBar: AppBar(
            backgroundColor: Renkler.kahverengi,
            title: Text(
              S.of(context).siparis_detayi,
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: FutureBuilder(
            future: faturadetayi,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Renkler.kahverengi),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Bir hata oluştu: ${snapshot.error}"),
                );
              }
              debugPrint(
                'gelen fatura sayisi : ${Provider.of<Siparislerprovider>(context, listen: false).faturadetayi.length.toString()}',
              );
              final Set<String> gorulenUrunler = {};
              final List<Widget> urunGorselleri = [];
              final List<Map<String, dynamic>> urunler = [];

              for (Map<String, dynamic> fatura
                  in Provider.of<Siparislerprovider>(
                    context,
                    listen: false,
                  ).faturadetayi) {
                if (!gorulenUrunler.contains(fatura['urunResmi'])) {
                  gorulenUrunler.add(fatura['urunResmi']);
                  urunGorselleri.add(
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(fatura['urunResmi']),
                    ),
                  );
                  urunler.add(fatura);
                }
              }
              final List<Map<String, dynamic>> faturalar =
                  Provider.of<Siparislerprovider>(
                    context,
                    listen: false,
                  ).faturadetayi;
              int toplamfiyat = 0;
              for (Map<String, dynamic> fatura in faturalar) {
                toplamfiyat += (fatura['toplamFiyat'] as num).toInt();
              }

              int toplamfiyatkargo = 0;
              for (Map<String, dynamic> fatura in faturalar) {
                toplamfiyatkargo += (fatura['kargoUcreti'] as num).toInt();
              }
              return ListView(
                padding: EdgeInsets.all(12),
                children: [
                  // Sipariş Bilgileri Kartı
                  buildCard(
                    children: [
                      buildRow(
                        S.of(context).siparis_no,
                        faturalar[0]['siparisID'].toString(),
                      ),
                      buildRow(
                        S.of(context).siparis_tarihi,
                        DateFormat(
                          'dd.MM.yyyy',
                        ).format(DateTime.parse(faturalar[0]['siparisTarihi'])),
                      ),
                      buildRow(
                        S.of(context).siparis_ozeti,
                        S
                            .of(context)
                            .teslimatUrunSayisi(1, urunGorselleri.length),
                        color: Renkler.kahverengi,
                      ),
                      buildRow(
                        S.of(context).siparis_detayi,
                        '${faturalar.length} ${S.of(context).teslim_edildi}',
                        color: Renkler.kahverengi,
                      ),
                      buildRow(
                        S.of(context).toplam,
                        toplamfiyat.toString(),
                        valueColor: Renkler.kahverengi,
                      ),
                    ],
                  ),

                  // Tahmini Teslimat Kartı
                  buildCard(
                    children: [
                      buildRow(
                        S.of(context).tahmini_teslimat,
                        DateFormat('dd.MM.yyyy').format(
                          DateTime.parse(faturalar[0]['tahmini_teslim_tarihi']),
                        ),
                        bold: true,
                      ),
                      buildRow(
                        S.of(context).teslimat_no,
                        faturalar[0]['ID'].toString(),
                      ),
                      SizedBox(height: 8),

                      Text(
                        "${S.of(context).satici} ${faturalar[0]['saticiadi']} ${faturalar[0]['saticisoyadi']}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // Ürün Bilgisi
                  for (Map<String, dynamic> urun in urunler)
                    buildCard(
                      children: [
                        Row(
                          children: [
                            urun['teslim_durumu'] == 1
                                ? Icon(Icons.check, color: Colors.green)
                                : Icon(
                                  Icons.lock_clock,
                                  color: Renkler.kahverengi,
                                ),
                            SizedBox(width: 8),
                            urun['teslim_durumu'] == 1
                                ? Text(
                                  S.of(context).teslim_edildi,
                                  style: TextStyle(color: Colors.green),
                                )
                                : Text(
                                  S.of(context).bekliyor,
                                  style: TextStyle(color: Renkler.kahverengi),
                                ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text("${S.of(context).kargo_firmasi}: "),
                            Text(
                              urun['kargosirketi'],
                              style: TextStyle(color: Renkler.kahverengi),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Image.network(
                              urun['urunResmi'],
                              fit: BoxFit.contain,
                              width: 70,
                              height: 70,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildRow(
                                    '${S.of(context).satici}:',
                                    '${urun['saticiadi']} ${urun['saticisoyadi']}',
                                    valueColor: Renkler.kahverengi,
                                  ),
                                  buildRow(
                                    S.of(context).ad,
                                    urun['urunAdi'],
                                    valueColor: Renkler.kahverengi,
                                  ),
                                  buildRow(
                                    S.of(context).adet,
                                    urun['urunSayisi'].toString(),
                                    valueColor: Renkler.kahverengi,
                                  ),
                                  buildRow(
                                    S.of(context).fiyat,
                                    urun['fiyat'].toString(),
                                    valueColor: Renkler.kahverengi,
                                  ),
                                  SizedBox(height: 4),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        S.of(context).urun_degerlendir,
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
                      Text(
                        "${S.of(context).alici}: ${faturalar[0]['musteriadi']} ${faturalar[0]['musterisoyadi']}",
                      ),
                      Wrap(
                        children: [
                          Text(
                            faturalar[0]['adres'],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      buildRow(
                        S.of(context).email,
                        faturalar[0]['musterimeil'],
                        valueColor: Renkler.kahverengi,
                      ),
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
                          Text(
                            S
                                .of(context)
                                .siparis_odeme(
                                  faturalar[0]['kartnumarasi']
                                      .toString()
                                      .substring(
                                        faturalar[0]['kartnumarasi']
                                                .toString()
                                                .length -
                                            4,
                                      ),
                                ),
                          ),
                        ],
                      ),
                      Divider(height: 20),
                      buildRow(
                        S.of(context).ara_toplam,
                        toplamfiyat.toString(),
                      ),
                      buildRow(
                        S.of(context).kargo,
                        toplamfiyatkargo.toString(),
                      ),
                      Divider(),
                      buildRow(
                        S.of(context).toplam,
                        (toplamfiyatkargo + toplamfiyat).toString(),
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
              );
            },
          ),
        ),
        Provider.of<Loadingprovider>(context, listen: false).isloading
            ? Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(83, 138, 103, 32),
                ),
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(color: Renkler.kahverengi),
                  ),
                ),
              ),
            )
            : SizedBox(),
      ],
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
