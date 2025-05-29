import 'package:bellibellu/analiz.dart';
import 'package:bellibellu/anasayfa.dart';
import 'package:bellibellu/anasayfaicerigi.dart';
import 'package:bellibellu/ensongezilenler.dart';
import 'package:bellibellu/gecmissiparisdetaysayfasi.dart';
import 'package:bellibellu/gecmissiparislersayfasi.dart';
import 'package:bellibellu/iletisim.dart';
import 'package:bellibellu/katagoriler.dart';
import 'package:bellibellu/kaydedilenler.dart';
import 'package:bellibellu/loginsayfasi.dart';
import 'package:bellibellu/logosayfasi.dart';
import 'package:bellibellu/main.dart';
import 'package:bellibellu/menu.dart';
import 'package:bellibellu/profilsayfasi.dart';
import 'package:bellibellu/sepetsayfasi.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/sohbeticerigisayfasi.dart';
import 'package:bellibellu/sohbetlersayfasi.dart';
import 'package:bellibellu/sorularsayfasi.dart';
import 'package:bellibellu/takimlar.dart';
import 'package:bellibellu/tumurunler.dart';
import 'package:bellibellu/urunekleme.dart';
import 'package:bellibellu/urunkartiicerigi.dart';
import 'package:bellibellu/urunler.dart';
import 'package:bellibellu/urunlerim.dart';
import 'package:bellibellu/urunlerseridi.dart';
import 'package:bellibellu/yorumlarsayfasi.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final routerkey = GlobalKey<NavigatorState>();

class Paths {
  Paths._();
  static const String anasayfa = '/';
  static const String katagoriler = '/katagoriler';
  static const String takimlar = '/takimlar';
  static const String iletisim = '/iletisim';
  static const String kaydedilenler = '/kaydedilenler';
  static const String analiz = '/analiz';
  static const String menu = '/menu';
  static const String urundetaylari = '/urundetaylari';
  static const String tumurunler = '/tumurunler';
  static const String ensongezilenler = '/ensongezilenler';
  static const String yorumlarsayfasi = '/yorumlarsayfasi';
  static const String sorularsayfasi = '/sorularsayfasi';
  static const String sepetsayfasi = '/sepetsayfasi';
  static const String urunlerim = '/urunlerim';
  static const String loginsayfasi = '/loginsayfasi';
  static const String profilsayfasi = '/profilsayfasi';
  static const String gecmissiparisler = '/gecmissiparisler';
  static const String gecmissiparisdetaylari = '/gecmissiparisdetaylari';
  static const String sohbetlersayfasi = '/sohbetlersayfasi';
  static const String sohbeticerigisayfasi = '/sohbeticerigisayfasi';
  static const String urunekleme = '/urunekleme';
}

// ignore: non_constant_identifier_names
final router = GoRouter(
  navigatorKey: routerkey,

  initialLocation:
      Cihazbellegi.girisyapildimi == null ||
              Cihazbellegi.girisyapildimi == false
          ? Paths.loginsayfasi
          : Paths.anasayfa,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              Anasayfa(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey:
              GlobalKey<NavigatorState>(), // Alt navigator için yeni key
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
              path: Paths.takimlar,
              builder: (context, state) => const Takimlar(),
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
              path: Paths.kaydedilenler,
              builder: (context, state) => Kaydedilenler(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.analiz,
              builder: (context, state) => AnalizSayfasi(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.sepetsayfasi,
              builder: (context, state) => SepetSayfasi(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.urunlerim,
              builder: (context, state) => Urunlerim(),
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
              path: Paths.tumurunler,
              builder: (context, state) => const Tumurunler(),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.urundetaylari,
              builder: (context, state) {
                final urunAdi = state.extra as String;

                return Urunkartiicerigi(
                  urunAdi: urunAdi,
                ); // Sayfaya nesneyi geçir
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.ensongezilenler,
              builder: (context, state) => Ensongezilenler(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.yorumlarsayfasi,
              builder: (context, state) {
                final IDler = state.extra as List<dynamic>;
                return YorumlarSayfasi(urunID: IDler[0], saticiID: IDler[1]);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.sorularsayfasi,
              builder: (context, state) {
                final IDler = state.extra as List<dynamic>;
                return Sorularsayfasi(urunID: IDler[0], saticiID: IDler[1]);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.loginsayfasi,
              builder: (context, state) => Loginpage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.profilsayfasi,
              builder: (context, state) => ProfilSayfasi(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.gecmissiparisler,
              builder: (context, state) => Gecmissiparislersayfasi(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.gecmissiparisdetaylari,
              builder: (context, state) {
                final int faturaID = state.extra as int;
                return Gecmissiparisdetaysayfasi(faturaID: faturaID);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.sohbetlersayfasi,
              builder: (context, state) => SaticiMesajlarimPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.sohbeticerigisayfasi,
              builder: (context, state) {
                final gereksinim = state.extra as Map<String,dynamic>;
                return SohbetIcerigiSayfasi(gereksinim : gereksinim);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Paths.urunekleme,
              builder: (context, state) => Urunekleme(),
            ),
          ],
        ),
      ],
    ),
  ],
);
