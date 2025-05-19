import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/loginsayfasi.dart';
import 'package:bellibellu/logosayfasi.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/urunlerprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await S.load(const Locale('tr')); // 🔥 Burada ilk dili yükleyin
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.brown, // 🔥 Burayı değiştirebilirsin
      statusBarIconBrightness:
          Brightness.light, // 🔥 İkonları beyaz yapmak için
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Dildestegiprovaider()),
        ChangeNotifierProvider(create: (context) => Kullanicilarprovider()),
        ChangeNotifierProvider(create: (context) => Urunlerprovider()),
      ],
      child: const Program(),
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
