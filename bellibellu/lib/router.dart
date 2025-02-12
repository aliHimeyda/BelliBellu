import 'package:bellibellu/anasayfa.dart';
import 'package:bellibellu/anasayfaicerigi.dart';
import 'package:bellibellu/iletisim.dart';
import 'package:bellibellu/katagoriler.dart';
import 'package:bellibellu/kaydedilenler.dart';
import 'package:bellibellu/menu.dart';
import 'package:bellibellu/ozelurunler.dart';
import 'package:bellibellu/tumurunler.dart';
import 'package:bellibellu/urunkarti.dart';
import 'package:bellibellu/urunkartiicerigi.dart';
import 'package:bellibellu/urunler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

 final  routerkey = GlobalKey<NavigatorState>();

class Paths {
  Paths._();
  static const String anasayfa = '/';
  static const String katagoriler = '/katagoriler';
  static const String iletisim = '/iletisim';
  static const String kaydedilenler = '/kaydedilenler';
  static const String menu = '/menu';
  static const String urundetaylari = '/urundetaylari';
  static const String tumurunler = '/tumurunler';
  static const String ozelurunler = '/ozelurunler';
}

// ignore: non_constant_identifier_names
final router = GoRouter(
  refreshListenable: KaydedilenUrunler(), // Değişiklikleri dinle
  navigatorKey: routerkey,

  initialLocation: Paths.anasayfa,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              Anasayfa(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.anasayfa,
              builder: (context, state) => const Anasayfaicerigi(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.katagoriler,
              builder: (context, state) => const Katagoriler(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.kaydedilenler,
              builder: (context, state) => Kaydedilenler(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.iletisim,
              builder: (context, state) => const Iletisim(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.menu,
              builder: (context, state) => const Menu(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.tumurunler,
              builder: (context, state) => const Tumurunler(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.ozelurunler,
              builder: (context, state) {
                final urunler =
                    state.extra as List<Urunler>; // Extra ile gelen veriyi al
                return Ozelurunler(
                  gelenurunler: urunler,
                ); // Sayfaya nesneyi geçir
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Paths.urundetaylari,
      builder: (context, state) {
        final urun = state.extra as Urunler; // Extra ile gelen veriyi al
        return Urunkartiicerigi(urun: urun); // Sayfaya nesneyi geçir
      },
    ),
  ],
);
