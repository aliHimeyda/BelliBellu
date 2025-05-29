import 'dart:async';

import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/main.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/mesajlarprovider.dart';
import 'package:bellibellu/services/mesajlarvt.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:riverpod/riverpod.dart' hide Provider;

class SohbetIcerigiSayfasi extends StatefulWidget {
  final Map<String, dynamic> gereksinim;
  const SohbetIcerigiSayfasi({super.key, required this.gereksinim});

  @override
  State<SohbetIcerigiSayfasi> createState() => _SohbetIcerigiSayfasiState();
}

class _SohbetIcerigiSayfasiState extends State<SohbetIcerigiSayfasi> {
  late ScrollController _scrollController;
  late TextEditingController mesajcontroller = TextEditingController();
  Timer? _yenilemeZamani;
  late Future<void> mesajlarigetir;
  late List<Map<String, dynamic>> sohbetmesajlari = [];
  Future<void> yeniMesajlariCek(BuildContext context) async {
    final mesajlar = await Mesajlarvt.yenimesajlariGetir(
      kullaniciID:
          Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri
              ? Provider.of<Kullanicilarprovider>(
                context,
                listen: false,
              ).currentkullanici['musteriID']
              : Provider.of<Kullanicilarprovider>(
                context,
                listen: false,
              ).currentkullanici['saticiID'], // aktif kullanıcı ID
      sohbetID: widget.gereksinim['sohbetID'], // aktif sohbet ID
    );
    debugPrint(mesajlar.length.toString());
    if (mesajlar.length > 0) {
      print("Yeni gelen mesajlar:");
      for (var mesaj in mesajlar) {
        print(mesaj['mesajMetni']); // örnek alan
      }
      sohbetmesajlari.addAll(mesajlar);
      setState(() {
        sohbetmesajlari;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  Future<void> MesajlariCek(BuildContext context) async {
    final mesajlar = await Mesajlarvt.mesajlariGetir(
      sohbetID: widget.gereksinim['sohbetID'], // aktif sohbet ID
    );
    debugPrint(mesajlar.length.toString());
    if (mesajlar.length > 0) {
      print("Yeni gelen mesajlar:");
      for (var mesaj in mesajlar) {
        print(mesaj['mesajMetni']); // örnek alan
      }
      sohbetmesajlari.addAll(mesajlar);
      setState(() {
        sohbetmesajlari;
      });
    }
  }

  @override
  void initState() {
    mesajlarigetir = MesajlariCek(context);
    // Timer her 5 saniyede bir çalışacak
    _yenilemeZamani = Timer.periodic(Duration(seconds: 2), (timer) async {
      await yeniMesajlariCek(context);
    });
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    _yenilemeZamani?.cancel(); // Sayfa kapatılırken Timer durdurulmalı
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.gereksinim['alici'],
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${S.of(context).iletisimBasligi} ${widget.gereksinim['sohbetID']}',
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
                widget.gereksinim['tarih'],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        child: FutureBuilder(
          future: mesajlarigetir,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Renkler.kahverengi),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Bir hata oluştu: ${snapshot.error}"));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: sohbetmesajlari.length,
                    itemBuilder: (context, index) {
                      if (Provider.of<Kullanicilarprovider>(
                        context,
                        listen: false,
                      ).ismusteri) {
                        if (sohbetmesajlari[index]['gonderenID'] ==
                            Provider.of<Kullanicilarprovider>(
                              context,
                              listen: false,
                            ).currentkullanici['musteriID']) {
                          return buildUserMessage(
                            sohbetmesajlari[index]['mesajMetni'],
                            DateFormat('HH:mm').format(
                              DateTime.parse(
                                sohbetmesajlari[index]['gonderilmeZamani'],
                              ),
                            ),
                          );
                        }
                        return buildSellerMessage(
                          sohbetmesajlari[index]['mesajMetni'],
                          DateFormat('HH:mm').format(
                            DateTime.parse(
                              sohbetmesajlari[index]['gonderilmeZamani'],
                            ),
                          ),
                        );
                      } else {
                        if (sohbetmesajlari[index]['gonderenID'] ==
                            Provider.of<Kullanicilarprovider>(
                              context,
                              listen: false,
                            ).currentkullanici['saticiID']) {
                          return buildUserMessage(
                            sohbetmesajlari[index]['mesajMetni'],
                            DateFormat('HH:mm').format(
                              DateTime.parse(
                                sohbetmesajlari[index]['gonderilmeZamani'],
                              ),
                            ),
                          );
                        }
                        return buildSellerMessage(
                          sohbetmesajlari[index]['mesajMetni'],
                          DateFormat('HH:mm').format(
                            DateTime.parse(
                              sohbetmesajlari[index]['gonderilmeZamani'],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),

                // Mesaj Yazma Kutusu
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                    color: Renkler.krem,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: mesajcontroller,
                          cursorColor: Renkler.kahverengi,
                          decoration: InputDecoration(
                            focusColor: Renkler.kahverengi,
                            fillColor: Renkler.kahverengi,
                            hintText: S.of(context).mesaj_yazin,
                            border: InputBorder.none,
                            labelStyle: TextStyle(color: Renkler.kahverengi),
                            floatingLabelStyle: TextStyle(
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Renkler.kahverengi),
                        onPressed: () async {
                          int? mesajID = await Mesajlarvt.mesajEkle(
                            sohbetID: widget.gereksinim['sohbetID'],
                            gonderenID:
                                Provider.of<Kullanicilarprovider>(
                                      context,
                                      listen: false,
                                    ).ismusteri
                                    ? Provider.of<Kullanicilarprovider>(
                                      context,
                                      listen: false,
                                    ).currentkullanici['musteriID']
                                    : Provider.of<Kullanicilarprovider>(
                                      context,
                                      listen: false,
                                    ).currentkullanici['saticiID'],
                            mesajMetni: mesajcontroller.text,
                            aliciID: widget.gereksinim['aliciID'],
                          );

                          if (mesajID != null) {
                            final mesaj = await Mesajlarvt.mesajGetir(mesajID);
                            if (mesaj != null) {
                              sohbetmesajlari.add(mesaj);
                              mesajcontroller.text = '';
                              setState(() {
                                sohbetmesajlari;
                              });
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              });
                            } else {
                              debugPrint('hata olustu , mesaj alinamadi !!!');
                            }
                          } else {
                            debugPrint('hata olustu , mesaj gonderilemedi !!!');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
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
            child: Icon(Icons.person),
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
