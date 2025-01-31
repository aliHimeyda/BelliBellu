import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';

class Iletisim extends StatelessWidget {
  const Iletisim({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:Renkler.kuyubeyaz,
      body: Center(child: Text('Iletisim')),
    );
  }
}
