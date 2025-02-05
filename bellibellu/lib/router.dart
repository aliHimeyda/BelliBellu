import 'package:bellibellu/anasayfa.dart';
import 'package:bellibellu/anasayfaicerigi.dart';
import 'package:bellibellu/iletisim.dart';
import 'package:bellibellu/katagoriler.dart';
import 'package:bellibellu/kaydedilenler.dart';
import 'package:bellibellu/menu.dart';
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
}

// ignore: non_constant_identifier_names
final router = GoRouter(
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
              builder: (context, state) => const Kaydedilenler(),
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
  ],
);
