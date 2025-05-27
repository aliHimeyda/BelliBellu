import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/siparislerprovider.dart';
import 'package:bellibellu/services/siparislervt.dart';
import 'package:bellibellu/services/yorumlarvt.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Gecmissiparislersayfasi extends StatefulWidget {
  const Gecmissiparislersayfasi({super.key});
  @override
  State<Gecmissiparislersayfasi> createState() =>
      _GecmissiparislersayfasiState();
}

class _GecmissiparislersayfasiState extends State<Gecmissiparislersayfasi> {
  late Future<void> gecmissiparisleriyukle;
  TextEditingController _textcontroller = TextEditingController();
  List<bool> selectedlist = [true, false, false];
  @override
  void initState() {
    super.initState();
    gecmissiparisleriyukle = gecmissiparisleriyuklem();
  }

  Future<void> gecmissiparisleriyuklem() async {
    Provider.of<Siparislerprovider>(
      context,
      listen: false,
    ).gecmissiparisler = await Siparislervt.tumgecmisSiparisleriGetir(
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici['kullaniciID'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                      borderSide: BorderSide(
                        color: Renkler.kahverengi,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 12),
              // Kategori Butonları
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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
              FutureBuilder(
                future: gecmissiparisleriyukle,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Renkler.kahverengi,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Bir hata oluştu: ${snapshot.error}"),
                    );
                  }
                  if (context
                          .watch<Siparislerprovider>()
                          .gecmissiparisler
                          .entries
                          .toList()
                          .length >
                      0) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount:
                            context
                                .watch<Siparislerprovider>()
                                .gecmissiparisler
                                .entries
                                .toList()
                                .length,
                        itemBuilder: (context, index) {
                          final entry =
                              context
                                  .watch<Siparislerprovider>()
                                  .gecmissiparisler
                                  .entries
                                  .toList()[index];
                          final String faturaID = entry.key;
                          final List<Map<String, dynamic>> urunler =
                              entry.value;
                          int toplamfiyat = 0;
                          for (Map<String, dynamic> urun in urunler) {
                            toplamfiyat += (urun['toplamFiyat'] as num).toInt();
                          }
                          return buildSiparisCard(
                            tarih: DateFormat('dd.MM.yyyy').format(
                              DateTime.parse(
                                context
                                    .watch<Siparislerprovider>()
                                    .gecmissiparisler[faturaID]![index]['siparisTarihi'],
                              ),
                            ),

                            toplam: toplamfiyat.toString(),
                            urunresimleri: [
                              ...urunler.asMap().entries.map((entry) {
                                final Map<String, dynamic> urun = entry.value;
                                return urun['urunResmi'];
                              }).toList(),
                            ],
                            urunler: urunler,
                            faturaID: int.parse(faturaID),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Renkler.krem,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                  'assets/sepetebos.png',
                                  color: Renkler.kahverengi,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                S.of(context).sepetBos,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Renkler.kahverengi,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
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

  void _telefonPopup(
    BuildContext context,
    List<Map<String, dynamic>> urunler,
    int toplamadet,
  ) {
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,

      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return SizedBox(
          height: 500,
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              top: 24,
            ),
            child: ListView.builder(
              itemCount: urunler.length,
              itemBuilder: (context, index) {
                return buildCard(
                  children: [
                    Row(
                      children: [
                        urunler[index]['teslim_durumu'] == 1
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.lock_clock, color: Renkler.kahverengi),
                        SizedBox(width: 8),
                        urunler[index]['teslim_durumu'] == 1
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
                          urunler[index]['kargosirketi'],
                          style: TextStyle(color: Renkler.kahverengi),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            urunler[index]['urunResmi'],
                            fit: BoxFit.contain,
                            width: 70,
                            height: 70,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildRow(
                                S.of(context).ad,
                                urunler[index]['urunAdi'],
                                valueColor: Renkler.kahverengi,
                              ),
                              buildRow(
                                S.of(context).adet,
                                (urunler[index]['urunSayisi'] *
                                        (toplamadet / urunler.length).toInt())
                                    .toString(),
                                valueColor: Renkler.kahverengi,
                              ),
                              buildRow(
                                S.of(context).fiyat,
                                urunler[index]['fiyat'].toString(),
                                valueColor: Renkler.kahverengi,
                              ),
                              SizedBox(height: 4),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _yorumPopup(
                                      context,
                                      urunler[index]['urunID'],
                                    );
                                  },
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
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildSiparisCard({
    required String tarih,
    required String toplam,
    required List<String> urunresimleri,
    required List<Map<String, dynamic>> urunler,
    required int faturaID,
  }) {
    final Set<String> gorulenUrunresimleri = {};
    final List<Widget> urunGorselleri = [];

    for (String e in urunresimleri) {
      if (!gorulenUrunresimleri.contains(e)) {
        gorulenUrunresimleri.add(e);
        urunGorselleri.add(
          SizedBox(width: 50, height: 50, child: Image.network(e)),
        );
      }
    }
    final List<Map<String, dynamic>> tekrarsizurunler = [];
    final Set<dynamic> eklenenUrunIDler = {};

    for (final urun in urunler) {
      final urunID = urun['urunID'];
      if (!eklenenUrunIDler.contains(urunID)) {
        eklenenUrunIDler.add(urunID);
        tekrarsizurunler.add(urun);
      }
    }

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
            Row(spacing: 5, children: urunGorselleri),
            SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  padding: EdgeInsets.all(0),
                  label: Text(
                    S.of(context).teslim_edildi,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  backgroundColor: Renkler.acikyesil,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    context.push(Paths.gecmissiparisdetaylari, extra: faturaID);
                  },
                  child: Text(
                    S.of(context).detaylar,
                    style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _telefonPopup(context, tekrarsizurunler, urunler.length);
                  },
                  child: Text(
                    S.of(context).degerlendir,
                    style: TextStyle(color: Colors.white, fontSize: 13),
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

  void _yorumPopup(BuildContext context, int urunID) {
    final TextEditingController text = TextEditingController();
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Renkler.kahverengi,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                S.of(context).yorumEkle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: text,
                maxLines: 3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: S.of(context).yorumEkle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi, // Buton rengi
                  ),
                  onPressed: () async {
                    await yorumgonder(text.text, urunID);
                    context.pop();
                  },
                  child: Text(
                    S.of(context).gonder,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 300),
            ],
          ),
        );
      },
    );
  }

  Future<void> yorumgonder(String yorum, int urunID) async {
    bool basari = await Yorumlarvt.yorumEkle(
      kullaniciID:
          Provider.of<Kullanicilarprovider>(
            context,
            listen: false,
          ).currentkullanici['kullaniciID'],
      urunID: urunID,
      yorumMetni: yorum,
    );
    if (basari) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).mesajDurumuGonderildi,
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
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
}
