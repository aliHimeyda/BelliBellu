// ignore_for_file: avoid_unnecessary_containers

import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Anasayfa extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const Anasayfa({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    // Mevcut sayfanın yolunu al (Yeni yöntem)
    final String currentPath = GoRouterState.of(context).uri.toString();

    // Eğer Ozelurunler sayfasındaysak, BottomNavigationBar'ı gösterme
    bool showBottomNavBar =
        currentPath != Paths.urundetaylari &&
        currentPath != Paths.yorumlarsayfasi &&
        currentPath != Paths.sorularsayfasi &&
        currentPath != Paths.loginsayfasi &&
        currentPath != Paths.sohbeticerigisayfasi &&
        currentPath != Paths.profilsayfasi;
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
      bottomNavigationBar:
          showBottomNavBar
              ? Padding(
                padding: EdgeInsets.only(top: 10),
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    labelTextStyle: WidgetStateProperty.all(
                      const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Renkler.kahverengi,
                      ),
                    ),
                  ),
                  child: NavigationBar(
                    backgroundColor: Renkler.kuyubeyaz,
                    height: 60,
                    selectedIndex: navigationShell.currentIndex,
                    indicatorColor: Renkler.krem,
                    onDestinationSelected: navigationShell.goBranch,
                    destinations: [
                      NavigationDestination(
                        icon: Icon(Icons.home, color: Renkler.kahverengi),
                        label: S.of(context).anasayfa,
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.category, color: Renkler.kahverengi),
                        label: S.of(context).kategoriler,
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.indeterminate_check_box,
                          color: Renkler.kahverengi,
                        ),
                        label: S.of(context).takimlar,
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.favorite, color: Renkler.kahverengi),
                        label: S.of(context).favorilerim,
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Renkler.kahverengi,
                        ),
                        label: S.of(context).sepetim,
                      ),
                      NavigationDestination(
                        icon: Icon(
                          Icons.person_outlined,
                          color: Renkler.kahverengi,
                        ),
                        label: S.of(context).menu,
                      ),
                    ],
                  ),
                ),
              )
              : null, // Eğer BottomNavigationBar gösterilmeyecekse, null döndür
      body: navigationShell,
      backgroundColor: Renkler.kuyubeyaz,
    );
  }
}
