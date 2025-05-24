import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
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
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        toolbarHeight: 80, // Yüksekliği artırdık
        backgroundColor: Renkler.krem,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Sol taraf: profil ve isim
            Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Renkler.kahverengi,

                  child: Icon(Icons.person, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    context.push(Paths.profilsayfasi);
                  },
                  child: Text(
                    S
                        .of(context)
                        .merhaba_kullanici(
                          context
                              .watch<Kullanicilarprovider>()
                              .currentkullanici['adi'],
                        ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Renkler.kahverengi,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Renkler.kahverengi,
                ),
              ],
            ),

            // Sağ taraf: ayar ikonları
            Row(
              children: [
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    context.push(Paths.sohbetlersayfasi);
                  },
                  child: Icon(
                    Icons.notifications_none,
                    color: Renkler.kahverengi,
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    dilsecimdialogu(context);
                  },
                  child: Text(
                    S.of(context).turkce_kodu,
                    style: TextStyle(color: Renkler.kahverengi),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  color: Renkler.kuyubeyaz,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Üst bar: Merhaba, Ayarlar, Bildirim, Dil
                      const SizedBox(height: 16),

                      // Butonlar
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          buton(S.of(context).siparisler, Icons.shopping_bag),
                          buton(S.of(context).hesap, Icons.person_outline),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push(
                      Paths.ensongezilenler,
                    ); // Sayfaya nesneyi geçir)
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      height: MediaQuery.of(context).size.width / 2 - 35,
                      decoration: BoxDecoration(
                        color: Renkler.krem,
                        border: Border.all(
                          width: 0.4,
                          color: Renkler.kahverengi,
                        ),
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
                        border: Border.all(
                          width: 0.4,
                          color: Renkler.kahverengi,
                        ),
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
                        border: Border.all(
                          width: 0.4,
                          color: Renkler.kahverengi,
                        ),
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
                    Provider.of<Urunlerprovider>(context, listen: false)
                        .currentPage = 1;
                    Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilimateryalOgeler.clear();
                    Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliortamOgeler.clear();
                    Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).seciliturOgeler.clear();
                    Provider.of<Urunlerprovider>(
                      context,
                      listen: false,
                    ).secilifiyatOgeler.clear();
                    Provider.of<Urunlerprovider>(context, listen: false)
                        .siralamaolcutu = '';
                    Provider.of<Urunlerprovider>(context, listen: false)
                        .urunAdi = '';
                    Provider.of<Urunlerprovider>(context, listen: false)
                        .tarihegore = '';
                    context.push(Paths.tumurunler);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 35,
                      height: MediaQuery.of(context).size.width / 2 - 35,
                      decoration: BoxDecoration(
                        color: Renkler.krem,
                        border: Border.all(
                          width: 0.4,
                          color: Renkler.kahverengi,
                        ),
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
                        border: Border.all(
                          width: 0.4,
                          color: Renkler.kahverengi,
                        ),
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
                        border: Border.all(
                          width: 0.4,
                          color: Renkler.kahverengi,
                        ),
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

  Widget buton(String metin, IconData ikon) {
    return OutlinedButton.icon(
      onPressed: () {
        context.push(Paths.gecmissiparisler);
      },
      icon: Icon(ikon, color: Renkler.kahverengi),
      label: Text(metin, style: const TextStyle(color: Renkler.kahverengi)),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        side: const BorderSide(color: Renkler.kahverengi),
      ),
    );
  }
}
