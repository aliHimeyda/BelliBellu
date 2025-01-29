// ignore_for_file: avoid_unnecessary_containers

import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';
import 'package:bellibellu/urunlerseridi.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Renkler.kahverengi,
        title: const Text('BelliBellu',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              'lib/icons/aramaiconu.png',
              width: 20,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'lib/icons/menuiconu.png',
              width: 20,
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Yatay kaydırmayı aktif et
              child: Wrap(
                spacing: 15,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width - 10,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Renkler.kuyubeyaz,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: NetworkImage(
                                'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/slider1.png'),
                            fit: BoxFit.cover,
                          ))),
                  Container(
                      decoration: BoxDecoration(
                        color: Renkler.kuyubeyaz,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width - 10,//ekran genisligi kadar
                      height: 300,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              image: NetworkImage(
                                  'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/slider2.png'),
                              fit: BoxFit.cover))),
                  Container(
                      decoration: BoxDecoration(
                        color: Renkler.kuyubeyaz,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width - 10,
                      height: 300,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              image: NetworkImage(
                                  'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/slider3.png'),
                              fit: BoxFit.cover)))
                ],
              )),
          Serid('2025'),
        ],
      ),
      backgroundColor: Renkler.kuyubeyaz,
    );
  }
}
