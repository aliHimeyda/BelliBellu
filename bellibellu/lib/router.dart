import 'package:bellibellu/anasayfa.dart';
import 'package:bellibellu/anasayfaicerigi.dart';
import 'package:bellibellu/iletisim.dart';
import 'package:bellibellu/katagoriler.dart';
import 'package:bellibellu/kaydedilenler.dart';
import 'package:bellibellu/menu.dart';
import 'package:bellibellu/urunkartiicerigi.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunozellikleri.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _routerkey = GlobalKey<NavigatorState>();

class Paths {
  Paths._();
  static const String anasayfa = '/';
  static const String katagoriler = '/katagoriler';
  static const String iletisim = '/iletisim';
  static const String kaydedilenler = '/kaydedilenler';
  static const String menu = '/menu';
  static const String urundetaylari = '/urundetaylari';
  static const String urunozellikleri = '/urunozellikleri';
}

// ignore: non_constant_identifier_names
final router = GoRouter(
  refreshListenable: KaydedilenUrunler(), // Değişiklikleri dinle
  navigatorKey: _routerkey,

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
      ],
    ),
    GoRoute(
      path: Paths.urundetaylari,
      builder: (context, state) {
        final urun = state.extra as Urunler; // Extra ile gelen veriyi al
        return Urunkartiicerigi(urun: urun); // Sayfaya nesneyi geçir
      },
    ),

    GoRoute(
      path: Paths.urunozellikleri,
      builder: (context, state) {
        final urun = state.extra as Urunler; // Extra ile gelen veriyi al
        return Urunozellikleri(urun: urun); // Sayfaya nesneyi geçir
      },
    ),
  ],
);
