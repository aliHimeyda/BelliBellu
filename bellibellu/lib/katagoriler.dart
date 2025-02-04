import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';

class Katagoriler extends StatelessWidget {
  const Katagoriler({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ozelkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Ozel Urunler',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/yenikatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            '2025 Yen Urunler',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ensevilenkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'En Begenilen Urunler',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/metalkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Metal Urunleri',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ahsapkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Ahsap Urunler',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/masakatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Masalar',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/sandalyekatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Sandalyeler',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/evkatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Ev Mobilya Urunleri',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('tiklandi');
                  },
                  child: SizedBox(
                    width: (MediaQuery.of(context).size.width / 2) - 10,
                    height: (MediaQuery.of(context).size.width / 2) - 10,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 2) - 50,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Renkler.kahverengi),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ofiskatagori.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Ofis Mobilya Urunleri',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                        ),
                      ],
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
}
