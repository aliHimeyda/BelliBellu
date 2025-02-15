import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
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
                      Icon(Icons.history, color: Renkler.kahverengi, size: 60),
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
                      Icon(Icons.favorite, color: Renkler.kahverengi, size: 60),
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
                      Icon(Icons.category, color: Renkler.kahverengi, size: 60),
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
                      Icon(Icons.language, color: Renkler.kahverengi, size: 60),
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
                        Icons.invert_colors,
                        color: Renkler.kahverengi,
                        size: 60,
                      ),
                      Text(
                        S.of(context).tema,
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
                width: MediaQuery.of(context).size.width - 35,
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
                      Icon(Icons.message, color: Renkler.kahverengi, size: 60),
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
    );
  }
}
