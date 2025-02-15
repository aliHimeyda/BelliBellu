import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  final int numara;
  const MessageScreen({super.key, required this.numara});

  @override
  // ignore: library_private_types_in_public_api
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Future<void> _sendSMS() async {
    final Uri whatsappUri = Uri.parse(
      "whatsapp://send?phone=${widget.numara}&text=",
    );

    try {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).whatsappAciklamasi(e))),
      );
    }
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri.parse(
      "mailto:alihameda417@gmail.com?subject=BelliBellu Musteri Hizmet Talebi&body=",
    );

    try {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "E-posta uygulaması bulunamadı! Gmail tarayıcıda açılıyor...",
          ),
        ),
      );

      // Tarayıcıda Gmail aç
      await launchUrl(
        Uri.parse(
          "https://mail.google.com/mail/?view=cm&fs=1&to=alihameda417@gmail.com&su=BelliBellu_musteri_hizmet_talebi&body=",
        ),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: _sendSMS,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Renkler.krem,
                border: Border.all(color: Renkler.kahverengi, width: 2),
              ),
              child: Center(
                child: Text(
                  S.of(context).whatsapp,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _sendEmail,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Renkler.krem,
                border: Border.all(color: Renkler.kahverengi, width: 2),
              ),
              child: Center(
                child: Text(
                  S.of(context).gmail,
                  style: TextStyle(
                    color: Renkler.kahverengi,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapLauncherScreen extends StatelessWidget {
  final double latitude = 41.010604; // Google Maps'ten aldığınız enlem değeri
  final double longitude = 29.168394;

  const MapLauncherScreen({
    super.key,
  }); // Google Maps'ten aldığınız boylam değeri

  Future<void> _openGoogleMaps() async {
    final Uri url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );

    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      // Tarayıcıda Google Maps aç
      await launchUrl(
        Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
        ),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _openGoogleMaps,
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(
                top: 35,
                bottom: 35,
                left: 10,
                right: 10,
              ),
              width: (MediaQuery.of(context).size.width - 5),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Renkler.kahverengi, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Renkler.kahverengi,
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/konum.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 15,
          child: Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Renkler.krem,
              border: Border.all(color: Renkler.kahverengi, width: 1.5),
            ),
            child: Center(
              child: Text(
                S.of(context).haritada,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Iletisim extends StatelessWidget {
  const Iletisim({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Renkler.krem,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Renkler.kahverengi, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Renkler.gri,
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: Renkler.kahverengi,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset('assets/aliresmi.png'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Ali HIMEYDA',
                            style: GoogleFonts.oswald(
                              fontSize: 25,
                              color: Renkler.kahverengi,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Renkler.kahverengi,
                                  width: 2,
                                ),
                              ),
                            ),
                            width: 222,
                            child: Column(
                              children: [
                                Text(
                                  S.of(context).bu_uygulamanin_gelistiricisidir,
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AutofillHints.name,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Align(
                                  alignment:
                                      Alignment.centerLeft, // Sola hizala
                                  child: Text(
                                    S.of(context).iletisimBasligi,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AutofillHints.name,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 5,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Renkler.kahverengi,
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Renkler.krem,
                                          size: 15,
                                        ),
                                        Text(
                                          ' +905372943871',
                                          style: TextStyle(
                                            color: Renkler.krem,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AutofillHints.name,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.mail,
                                          color: Renkler.krem,
                                          size: 15,
                                        ),
                                        Text(
                                          ' alihameda417@gmail.com',
                                          style: TextStyle(
                                            color: Renkler.krem,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AutofillHints.name,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const MessageScreen(numara: 905372943871),
                          //iletisim screeeeeeeeeeeeeen
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Renkler.krem,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Renkler.kahverengi, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Renkler.gri,
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(13),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color: Renkler.kahverengi,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.asset('assets/anonimresmi.png'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Bilal HIMEYDA',
                            style: GoogleFonts.oswald(
                              fontSize: 25,
                              color: Renkler.kahverengi,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Renkler.kahverengi,
                                  width: 2,
                                ),
                              ),
                            ),
                            width: 250,
                            child: Column(
                              children: [
                                Text(
                                  S
                                      .of(context)
                                      .uygulamadaki_urunlerin_ureticisidir,
                                  style: TextStyle(
                                    color: Renkler.kahverengi,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AutofillHints.name,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Align(
                                  alignment:
                                      Alignment.centerLeft, // Sola hizala
                                  child: Text(
                                    S.of(context).iletisimBasligi,
                                    style: TextStyle(
                                      color: Renkler.kahverengi,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AutofillHints.name,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: (MediaQuery.of(context).size.width / 2) - 5,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Renkler.kahverengi,
                            ),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Renkler.krem,
                                          size: 15,
                                        ),
                                        Text(
                                          ' +905380166105',
                                          style: TextStyle(
                                            color: Renkler.krem,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AutofillHints.name,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.mail,
                                          color: Renkler.krem,
                                          size: 15,
                                        ),
                                        Text(
                                          ' bilalhammeda0@gmail.com',
                                          style: TextStyle(
                                            color: Renkler.krem,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AutofillHints.name,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const MessageScreen(numara: 905380166105),
                          //iletisim screeeeeeeeeeeeeen
                        ],
                      ),
                    ),
                  ),
                ),

                //bilal karti
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Renkler.kahverengi, width: 2),
              ),
            ),
            width: 250,
          ),
          const MapLauncherScreen(),
        ],
      ),
    );
  }
}
