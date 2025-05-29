import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/loginsayfasi.dart';
import 'package:bellibellu/logosayfasi.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/mesajlarprovider.dart';
import 'package:bellibellu/services/seridlerprovider.dart';
import 'package:bellibellu/services/siparislerprovider.dart';
import 'package:bellibellu/services/sorularprovider.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:bellibellu/services/yorumlarprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';

final getitkullanici = GetIt.instance;
final getitmesajlar = GetIt.instance;

void setupLocator() {
  getitkullanici.registerLazySingleton<Kullanicilarprovider>(
    () => Kullanicilarprovider(),
  );
  getitmesajlar.registerLazySingleton<Mesajlarprovider>(
    () => Mesajlarprovider(),
  );
}

void main() async {
  setupLocator(); // get_it setup
  WidgetsFlutterBinding.ensureInitialized();
  await S.load(const Locale('tr')); //  Burada ilk dili yükleyin

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.brown,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    Phoenix(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Dildestegiprovaider()),
          ChangeNotifierProvider<Kullanicilarprovider>.value(
            value: getitkullanici<Kullanicilarprovider>(),
          ),
          ChangeNotifierProvider(create: (context) => Urunlerprovider()),
          ChangeNotifierProvider(create: (context) => Loadingprovider()),
          ChangeNotifierProvider(create: (context) => Seridlerprovider()),
          ChangeNotifierProvider(create: (context) => Siparislerprovider()),
          ChangeNotifierProvider(create: (context) => Yorumlarprovider()),
          ChangeNotifierProvider(create: (context) => Sorularprovider()),
          ChangeNotifierProvider<Mesajlarprovider>.value(
            value: getitkullanici<Mesajlarprovider>(),
          ),
        ],
        child: const Program(),
      ),
    ),
  );
}

class Program extends StatelessWidget {
  const Program({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Dildestegiprovaider>(
      builder:
          (context, value, child) => MaterialApp(
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Dildestegiprovaider.current,
            debugShowCheckedModeBanner: false,
            home: Logosayfasi(),
          ),
    );
  }
}
