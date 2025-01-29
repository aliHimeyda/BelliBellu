// ignore_for_file: avoid_unnecessary_containers

import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
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
          Urunkarti(
              'lib/images/resim2.png', 'df', 34, 'dskfjdsklfjkldsjfklds', 43),
          Urunkarti(
              'lib/images/resim2.png', 'df', 34, 'dskfjdsklfjkldsjfklds', 43),
          Serid('2025',2)
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
