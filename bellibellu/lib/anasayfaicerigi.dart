import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:flutter/material.dart';

class Anasayfaicerigi extends StatelessWidget {
  const Anasayfaicerigi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.kuyubeyaz,
      body: Stack(
        children: [
          ListView(
            addAutomaticKeepAlives:
                false, // 🔥 Yeniden oluşturulmasını engeller
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Yatay kaydırmayı aktif et

                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Wrap(
                      spacing: 15,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width - 10,
                            height: 190,
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image: NetworkImage(
                                      'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/slider1.png'),
                                  fit: BoxFit.contain,
                                ))),
                        Container(
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width -
                                10, //ekran genisligi kadar
                            height: 190,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                    image: NetworkImage(
                                        'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/slider2.png'),
                                    fit: BoxFit.contain))),
                        Container(
                            decoration: BoxDecoration(
                              color: Renkler.kuyubeyaz,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width - 10,
                            height: 190,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                    image: NetworkImage(
                                        'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/slider3.png'),
                                    fit: BoxFit.contain)))
                      ],
                    ),
                  )),
              Column(
                children: [
                  Serid('2025 Urunlari'),
                  Serid('En Cok Favorilenen'),
                  Serid('Ofis Mobilya Urunleri'),
                  Serid('Ev Urunleri'),
                ],
              ),
            ],
          ),
          Container(
            color: Renkler.kuyubeyaz,
            child: Row(
              children: [
                Positioned(
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    child: SizedBox(
                      width: 400,
                      height: 35,
                      child: TextField(
                        cursorColor: Renkler.bordo,
                        onChanged: (value) {
                          // Arama işlemleri burada yazılacak
                        },
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: Renkler.kahverengi,
                              size: 17,
                            ),
                            onPressed: () {},
                          ),
                          hintText: 'Magazada Arayin',
                          focusColor: Renkler.kahverengi,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                          filled: true,
                          fillColor: Renkler.kuyubeyaz,
                          contentPadding: const EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.email)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
