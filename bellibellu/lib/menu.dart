import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String secilendil = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.push(Paths.ensongezilenler); // Sayfaya nesneyi geçir)
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: MediaQuery.of(context).size.width / 2 - 35,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      border: Border.all(width: 0.4, color: Renkler.kahverengi),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history,
                            color: Renkler.kahverengi,
                            size: 60,
                          ),
                          Text(
                            S.of(context).gecmis,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(Paths.kaydedilenler); // Sayfaya nesneyi geçir)
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: MediaQuery.of(context).size.width / 2 - 35,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      border: Border.all(width: 0.4, color: Renkler.kahverengi),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Renkler.kahverengi,
                            size: 60,
                          ),
                          Text(
                            S.of(context).favorilerim,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(Paths.katagoriler);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: MediaQuery.of(context).size.width / 2 - 35,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      border: Border.all(width: 0.4, color: Renkler.kahverengi),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category,
                            color: Renkler.kahverengi,
                            size: 60,
                          ),
                          Text(
                            S.of(context).kategoriler,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(Paths.tumurunler);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: MediaQuery.of(context).size.width / 2 - 35,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      border: Border.all(width: 0.4, color: Renkler.kahverengi),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.all_inbox,
                            color: Renkler.kahverengi,
                            size: 60,
                          ),
                          Text(
                            S.of(context).urunler,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  dilsecimdialogu(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: MediaQuery.of(context).size.width / 2 - 35,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      border: Border.all(width: 0.4, color: Renkler.kahverengi),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.language,
                            color: Renkler.kahverengi,
                            size: 60,
                          ),
                          Text(
                            S.of(context).dil_ayarlari,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.push(Paths.iletisim);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 35,
                    height: MediaQuery.of(context).size.width / 2 - 35,
                    decoration: BoxDecoration(
                      color: Renkler.krem,
                      border: Border.all(width: 0.4, color: Renkler.kahverengi),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message,
                            color: Renkler.kahverengi,
                            size: 60,
                          ),
                          Text(
                            S.of(context).iletisim,
                            style: TextStyle(
                              color: Renkler.kahverengi,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void dilsecimdialogu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                S.of(context).dil_ayarlari,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,
              iconColor: Renkler.koyuYesil,

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).turkce,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).turkce,
                    groupValue: secilendil, // ✅ Doğru kullanım
                    onChanged: (String? value) {
                      setState(() {
                        secilendil = (secilendil == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).ingilizce,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).ingilizce,
                    groupValue: secilendil,
                    onChanged: (String? value) {
                      setState(() {
                        secilendil = (secilendil == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).arapca,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).arapca,
                    groupValue: secilendil,
                    onChanged: (String? value) {
                      setState(() {
                        secilendil = (secilendil == value) ? "" : value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (secilendil == S.of(context).arapca) {
                        context.read<Dildestegiprovaider>().setarabic();
                        Navigator.pop(context);
                      } else if (secilendil == S.of(context).ingilizce) {
                        context.read<Dildestegiprovaider>().setenglish();
                        Navigator.pop(context);
                      } else if (secilendil == S.of(context).turkce) {
                        context.read<Dildestegiprovaider>().setturkish();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      S.of(context).uygula,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
