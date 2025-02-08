import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:bellibellu/urunkartiicerigi.dart';
import 'package:grock/grock.dart';

class Urunozellikleri extends StatefulWidget {
  final Urunler urun;
  const Urunozellikleri({super.key, required this.urun});

  @override
  State<Urunozellikleri> createState() => _UrunozellikleriState();
}

class _UrunozellikleriState extends State<Urunozellikleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(children: [kalpiconu(), altnavigation(context)]),
        ],
      ),
    );
  }

  Positioned altnavigation(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(color: Renkler.kuyubeyaz),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite, color: Renkler.kahverengi, size: 20),
                  Text(
                    '${widget.urun.begenisayisi}',
                    style: TextStyle(fontSize: 15, color: Renkler.kahverengi),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Renkler.kahverengi,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'ILETISIM',
                      style: TextStyle(
                        color: Renkler.krem,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                '${widget.urun.urunfiyati}TL',
                style: TextStyle(fontSize: 15, color: Renkler.kahverengi),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Positioned kalpiconu() {
    return Positioned(
      top: 35,
      right: 10,
      child: Container(
        width: 27,
        height: 27,
        decoration: BoxDecoration(
          color: Renkler.krem,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Renkler.kahverengi),
        ),
        child: Center(
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              debugPrint('${widget.urun.urunAdi} tiklandi');
              widget.urun.begenilmismi
                  ? widget.urun.begenilmismi = false
                  : widget.urun.begenilmismi = true;
              setState(() {
                if (widget.urun.begenilmismi) {
                  widget.colored(color: Renkler.kirmizi);
                  begenilenekaydet(widget.urun.urunAdi);
                } else {
                  widget.colored(color: Colors.white);
                  begenilendensil(widget.urun.urunAdi);
                }
              });
            },
            icon: Icon(
              Icons.favorite,
              color: widget.urun.begenilmismi ? Renkler.kirmizi : Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
