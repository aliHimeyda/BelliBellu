// ignore_for_file: avoid_unnecessary_containers

import 'package:bellibellu/renkler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Anasayfa extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const Anasayfa({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    bool _bottumngoster = true;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: 20),
      //     child: SizedBox(
      //       width: 200,
      //       child: TextField(
      //         onChanged: (value) {
      //           // Arama işlemleri burada yazılacak
      //         },
      //         decoration: InputDecoration(
      //           suffixIcon: IconButton(
      //             icon: Image.asset(
      //               'lib/icons/aramaiconu.png',
      //               width: 20,
      //               color: Renkler.kahverengi,
      //             ),
      //             onPressed: () {},
      //           ),
      //           hintText: 'Arama yap',
      //           border:
      //               OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      //           filled: true,
      //           fillColor: Renkler.kuyubeyaz,
      //           contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      //         ),
      //       ),
      //     ),
      //   ),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 10),
      //       child: Text('BelliBellu',
      //           style: TextStyle(fontSize: 20, color: Renkler.kahverengi)),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Renkler.kahverengi),
          ),
        ),
        child: NavigationBar(
          
          backgroundColor: Renkler.kuyubeyaz,
          height: 60,
          selectedIndex: navigationShell.currentIndex,
          indicatorColor: Renkler.krem,
          onDestinationSelected: navigationShell.goBranch,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home, color: Renkler.kahverengi),
              label: 'Anasayfa',
            ),
            NavigationDestination(
              icon: Icon(Icons.category, color: Renkler.kahverengi),
              label: 'Katagoriler',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite, color: Renkler.kahverengi),
              label: 'Favorilerim',
            ),
            NavigationDestination(
              icon: Icon(Icons.contact_mail, color: Renkler.kahverengi),
              label: 'Iletisim',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu, color: Renkler.kahverengi),
              label: 'Menu',
            ),
          ],
        ),
      ),
      body: navigationShell,
      backgroundColor: Renkler.kuyubeyaz,
    );
  }
}
