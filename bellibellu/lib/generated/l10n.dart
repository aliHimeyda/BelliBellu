// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Table`
  String get masaonerisi {
    return Intl.message(
      'Table',
      name: 'masaonerisi',
      desc: 'Table suggestion',
      args: [],
    );
  }

  /// `Chair`
  String get sandalyeonerisi {
    return Intl.message(
      'Chair',
      name: 'sandalyeonerisi',
      desc: 'Chair suggestion',
      args: [],
    );
  }

  /// `Home furniture`
  String get evMobilyaUrunlerionerisi {
    return Intl.message(
      'Home furniture',
      name: 'evMobilyaUrunlerionerisi',
      desc: 'Home furniture suggestion',
      args: [],
    );
  }

  /// `Office furniture`
  String get ofisMobilyalarionerisi {
    return Intl.message(
      'Office furniture',
      name: 'ofisMobilyalarionerisi',
      desc: 'Office furniture suggestion',
      args: [],
    );
  }

  /// `Metal table`
  String get metalmasaonerisi {
    return Intl.message(
      'Metal table',
      name: 'metalmasaonerisi',
      desc: 'Metal table suggestion',
      args: [],
    );
  }

  /// `Metal chair`
  String get metalsandalyeonerisi {
    return Intl.message(
      'Metal chair',
      name: 'metalsandalyeonerisi',
      desc: 'Metal chair suggestion',
      args: [],
    );
  }

  /// `Wooden products`
  String get ahsapUrunleronerisi {
    return Intl.message(
      'Wooden products',
      name: 'ahsapUrunleronerisi',
      desc: 'Wooden product suggestion',
      args: [],
    );
  }

  /// `Cafe furniture`
  String get kafeurunlerionerisi {
    return Intl.message(
      'Cafe furniture',
      name: 'kafeurunlerionerisi',
      desc: 'Cafe furniture suggestion',
      args: [],
    );
  }

  /// `Steel`
  String get celik {
    return Intl.message(
      'Steel',
      name: 'celik',
      desc: 'Steel material',
      args: [],
    );
  }

  /// `Wood`
  String get ahsap {
    return Intl.message('Wood', name: 'ahsap', desc: 'Wood material', args: []);
  }

  /// `Metal`
  String get metal {
    return Intl.message(
      'Metal',
      name: 'metal',
      desc: 'Metal material',
      args: [],
    );
  }

  /// `Home`
  String get ev {
    return Intl.message('Home', name: 'ev', desc: 'Home environment', args: []);
  }

  /// `Office`
  String get ofis {
    return Intl.message(
      'Office',
      name: 'ofis',
      desc: 'Office environment',
      args: [],
    );
  }

  /// `Cafe`
  String get kafe {
    return Intl.message(
      'Cafe',
      name: 'kafe',
      desc: 'Cafe environment',
      args: [],
    );
  }

  /// `Table`
  String get masa {
    return Intl.message(
      'Table',
      name: 'masa',
      desc: 'Table category',
      args: [],
    );
  }

  /// `Chair`
  String get sandalye {
    return Intl.message(
      'Chair',
      name: 'sandalye',
      desc: 'Chair category',
      args: [],
    );
  }

  /// `Multi-language Supported App`
  String get uygulamaBasligi {
    return Intl.message(
      'Multi-language Supported App',
      name: 'uygulamaBasligi',
      desc: 'Application title',
      args: [],
    );
  }

  /// `Search in the store`
  String get aramaIpucu {
    return Intl.message(
      'Search in the store',
      name: 'aramaIpucu',
      desc: 'Search box hint text',
      args: [],
    );
  }

  /// `Search Suggestions`
  String get onerilerBaslik {
    return Intl.message(
      'Search Suggestions',
      name: 'onerilerBaslik',
      desc: 'Suggestions title',
      args: [],
    );
  }

  /// `2025 Products`
  String get urunSerisi2025 {
    return Intl.message(
      '2025 Products',
      name: 'urunSerisi2025',
      desc: '2025 Products title',
      args: [],
    );
  }

  /// `Most Favorited`
  String get enCokFavori {
    return Intl.message(
      'Most Favorited',
      name: 'enCokFavori',
      desc: 'Most favorited products title',
      args: [],
    );
  }

  /// `Office Furniture`
  String get ofisMobilyalari {
    return Intl.message(
      'Office Furniture',
      name: 'ofisMobilyalari',
      desc: 'Office furniture title',
      args: [],
    );
  }

  /// `Home Products`
  String get evUrunleri {
    return Intl.message(
      'Home Products',
      name: 'evUrunleri',
      desc: 'Home products title',
      args: [],
    );
  }

  /// `Featured Categories`
  String get yildizliKategoriler {
    return Intl.message(
      'Featured Categories',
      name: 'yildizliKategoriler',
      desc: 'Featured categories title',
      args: [],
    );
  }

  /// `Most Liked`
  String get enCokBegenilenler {
    return Intl.message(
      'Most Liked',
      name: 'enCokBegenilenler',
      desc: 'Most liked label',
      args: [],
    );
  }

  /// `Legendary Products`
  String get efsaneUrunler {
    return Intl.message(
      'Legendary Products',
      name: 'efsaneUrunler',
      desc: 'Legendary products label',
      args: [],
    );
  }

  /// `Start Shopping`
  String get alisveriseBasla {
    return Intl.message(
      'Start Shopping',
      name: 'alisveriseBasla',
      desc: 'Start shopping button',
      args: [],
    );
  }

  /// `No matching products found.`
  String get urunBulunamadi {
    return Intl.message(
      'No matching products found.',
      name: 'urunBulunamadi',
      desc: 'No matching product message',
      args: [],
    );
  }

  /// `Clicked!`
  String get tiklandiMesaji {
    return Intl.message(
      'Clicked!',
      name: 'tiklandiMesaji',
      desc: 'Click debug message',
      args: [],
    );
  }

  /// `All Products`
  String get tumurunler {
    return Intl.message(
      'All Products',
      name: 'tumurunler',
      desc: 'All products title',
      args: [],
    );
  }

  /// `Homepage`
  String get anasayfa {
    return Intl.message(
      'Homepage',
      name: 'anasayfa',
      desc: 'Homepage label',
      args: [],
    );
  }

  /// `Categories`
  String get kategoriler {
    return Intl.message(
      'Categories',
      name: 'kategoriler',
      desc: 'Categories label',
      args: [],
    );
  }

  /// `Favorites`
  String get favorilerim {
    return Intl.message(
      'Favorites',
      name: 'favorilerim',
      desc: 'Favorites label',
      args: [],
    );
  }

  /// `CONTACT`
  String get iletisim {
    return Intl.message(
      'CONTACT',
      name: 'iletisim',
      desc: 'Contact label',
      args: [],
    );
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: 'Menu label', args: []);
  }

  /// `BelliBellu`
  String get uygulamaAdi {
    return Intl.message(
      'BelliBellu',
      name: 'uygulamaAdi',
      desc: 'Application name (BelliBellu)',
      args: [],
    );
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message(
      'WhatsApp',
      name: 'whatsapp',
      desc: 'WhatsApp button label',
      args: [],
    );
  }

  /// `Gmail`
  String get gmail {
    return Intl.message(
      'Gmail',
      name: 'gmail',
      desc: 'Gmail button label',
      args: [],
    );
  }

  /// `WhatsApp could not be opened! Error: {error}`
  String whatsappAciklamasi(Object error) {
    return Intl.message(
      'WhatsApp could not be opened! Error: $error',
      name: 'whatsappAciklamasi',
      desc: 'WhatsApp error message',
      args: [error],
    );
  }

  /// `No email app found! Gmail is opening in the browser...`
  String get epostaUygulamasiYok {
    return Intl.message(
      'No email app found! Gmail is opening in the browser...',
      name: 'epostaUygulamasiYok',
      desc: 'No email app found message',
      args: [],
    );
  }

  /// `Contact:`
  String get iletisimBasligi {
    return Intl.message(
      'Contact:',
      name: 'iletisimBasligi',
      desc: 'Contact title',
      args: [],
    );
  }

  /// `Phone:`
  String get telefon {
    return Intl.message(
      'Phone:',
      name: 'telefon',
      desc: 'Phone label',
      args: [],
    );
  }

  /// `Email:`
  String get eposta {
    return Intl.message(
      'Email:',
      name: 'eposta',
      desc: 'Email label',
      args: [],
    );
  }

  /// `Sort`
  String get sirala {
    return Intl.message(
      'Sort',
      name: 'sirala',
      desc: 'Sorting title',
      args: [],
    );
  }

  /// `Filter`
  String get filtrele {
    return Intl.message(
      'Filter',
      name: 'filtrele',
      desc: 'Filter button label',
      args: [],
    );
  }

  /// `Apply`
  String get uygula {
    return Intl.message(
      'Apply',
      name: 'uygula',
      desc: 'Apply button',
      args: [],
    );
  }

  /// `Browse New Products`
  String get yeniurunler {
    return Intl.message(
      'Browse New Products',
      name: 'yeniurunler',
      desc: 'Button label for browsing new products',
      args: [],
    );
  }

  /// `Recommended Products`
  String get begenebilecegin {
    return Intl.message(
      'Recommended Products',
      name: 'begenebilecegin',
      desc: 'Button label for recommended products',
      args: [],
    );
  }

  /// `Weight`
  String get agirlik {
    return Intl.message(
      'Weight',
      name: 'agirlik',
      desc: 'Product weight label',
      args: [],
    );
  }

  /// `Material`
  String get materyal {
    return Intl.message(
      'Material',
      name: 'materyal',
      desc: 'Product material label',
      args: [],
    );
  }

  /// `Name`
  String get ad {
    return Intl.message(
      'Name',
      name: 'ad',
      desc: 'Product name label',
      args: [],
    );
  }

  /// `Type`
  String get tur {
    return Intl.message(
      'Type',
      name: 'tur',
      desc: 'Product type label',
      args: [],
    );
  }

  /// `Environment`
  String get ortam {
    return Intl.message(
      'Environment',
      name: 'ortam',
      desc: 'Product environment label',
      args: [],
    );
  }

  /// `SPECIAL PRODUCTS`
  String get ozelurunler {
    return Intl.message(
      'SPECIAL PRODUCTS',
      name: 'ozelurunler',
      desc: 'Special Products label',
      args: [],
    );
  }

  /// `WARRANTY PERIOD :`
  String get garanti_suresi {
    return Intl.message(
      'WARRANTY PERIOD :',
      name: 'garanti_suresi',
      desc: 'Warranty Period label',
      args: [],
    );
  }

  /// `The warranty period of the products is 1 year.`
  String get urunlerin_garanti_suresi {
    return Intl.message(
      'The warranty period of the products is 1 year.',
      name: 'urunlerin_garanti_suresi',
      desc: 'Product warranty period information',
      args: [],
    );
  }

  /// `This product is manufactured in Turkey.`
  String get bu_urun_turkiyede_uretilmistir {
    return Intl.message(
      'This product is manufactured in Turkey.',
      name: 'bu_urun_turkiyede_uretilmistir',
      desc: 'Product manufacturing location information',
      args: [],
    );
  }

  /// `ALL FEATURES`
  String get tum_ozellikler {
    return Intl.message(
      'ALL FEATURES',
      name: 'tum_ozellikler',
      desc: 'Button to show all features',
      args: [],
    );
  }

  /// `PRODUCT FEATURES`
  String get urun_ozellikleri {
    return Intl.message(
      'PRODUCT FEATURES',
      name: 'urun_ozellikleri',
      desc: 'Product features title',
      args: [],
    );
  }

  /// `FREQUENTLY ASKED QUESTIONS`
  String get sik_sorulanlar {
    return Intl.message(
      'FREQUENTLY ASKED QUESTIONS',
      name: 'sik_sorulanlar',
      desc: 'Frequently Asked Questions title',
      args: [],
    );
  }

  /// `MORE {tur} PRODUCTS`
  String daha_fazla_tur(Object tur) {
    return Intl.message(
      'MORE $tur PRODUCTS',
      name: 'daha_fazla_tur',
      desc: 'More products of the specified type',
      args: [tur],
    );
  }

  /// `MORE {ortam} PRODUCTS`
  String daha_fazla_ortam(Object ortam) {
    return Intl.message(
      'MORE $ortam PRODUCTS',
      name: 'daha_fazla_ortam',
      desc: 'More products for the specified environment',
      args: [ortam],
    );
  }

  /// `MORE {materyal} PRODUCTS`
  String daha_fazla_materyal(Object materyal) {
    return Intl.message(
      'MORE $materyal PRODUCTS',
      name: 'daha_fazla_materyal',
      desc: 'More products of the specified material',
      args: [materyal],
    );
  }

  /// `On map`
  String get haritada {
    return Intl.message(
      'On map',
      name: 'haritada',
      desc: 'Open in map button label',
      args: [],
    );
  }

  /// `The manufacturer of the products in the application`
  String get uygulamadaki_urunlerin_ureticisidir {
    return Intl.message(
      'The manufacturer of the products in the application',
      name: 'uygulamadaki_urunlerin_ureticisidir',
      desc: 'Label for the manufacturer of products in the application',
      args: [],
    );
  }

  /// `The developer of this application`
  String get bu_uygulamanin_gelistiricisidir {
    return Intl.message(
      'The developer of this application',
      name: 'bu_uygulamanin_gelistiricisidir',
      desc: 'Label for the developer of the application',
      args: [],
    );
  }

  /// `Favorite product list is empty !!`
  String get begenilen_urun_listesi_bos {
    return Intl.message(
      'Favorite product list is empty !!',
      name: 'begenilen_urun_listesi_bos',
      desc: 'Favorite product list is empty message',
      args: [],
    );
  }

  /// `Recommended`
  String get onerilen {
    return Intl.message(
      'Recommended',
      name: 'onerilen',
      desc: 'Recommended sorting option',
      args: [],
    );
  }

  /// `Lowest Price`
  String get en_dusuk_fiyat {
    return Intl.message(
      'Lowest Price',
      name: 'en_dusuk_fiyat',
      desc: 'Lowest price option',
      args: [],
    );
  }

  /// `Highest Price`
  String get en_yuksek_fiyat {
    return Intl.message(
      'Highest Price',
      name: 'en_yuksek_fiyat',
      desc: 'Highest price option',
      args: [],
    );
  }

  /// `Most Liked`
  String get en_cok_begenilen {
    return Intl.message(
      'Most Liked',
      name: 'en_cok_begenilen',
      desc: 'Most liked products option',
      args: [],
    );
  }

  /// `Newest Products`
  String get en_yeni_urunler {
    return Intl.message(
      'Newest Products',
      name: 'en_yeni_urunler',
      desc: 'Newest products option',
      args: [],
    );
  }

  /// `Clear`
  String get temizle {
    return Intl.message(
      'Clear',
      name: 'temizle',
      desc: 'Clear button label',
      args: [],
    );
  }

  /// `Get Products`
  String get urunleri_getir {
    return Intl.message(
      'Get Products',
      name: 'urunleri_getir',
      desc: 'Get products button label',
      args: [],
    );
  }

  /// `Price`
  String get fiyat {
    return Intl.message('Price', name: 'fiyat', desc: 'Price label', args: []);
  }

  /// `By Type :`
  String get ture_gore {
    return Intl.message(
      'By Type :',
      name: 'ture_gore',
      desc: 'Sort by type label',
      args: [],
    );
  }

  /// `By Environment :`
  String get ortama_gore {
    return Intl.message(
      'By Environment :',
      name: 'ortama_gore',
      desc: 'Sort by environment label',
      args: [],
    );
  }

  /// `By Material :`
  String get materyale_gore {
    return Intl.message(
      'By Material :',
      name: 'materyale_gore',
      desc: 'Sort by material label',
      args: [],
    );
  }

  /// `By Price :`
  String get fiyata_gore {
    return Intl.message(
      'By Price :',
      name: 'fiyata_gore',
      desc: 'Sort by price label',
      args: [],
    );
  }

  /// `Theme`
  String get tema {
    return Intl.message(
      'Theme',
      name: 'tema',
      desc: 'Theme settings label',
      args: [],
    );
  }

  /// `Products`
  String get urunler {
    return Intl.message(
      'Products',
      name: 'urunler',
      desc: 'Products label',
      args: [],
    );
  }

  /// `Language Settings`
  String get dil_ayarlari {
    return Intl.message(
      'Language Settings',
      name: 'dil_ayarlari',
      desc: 'Language settings label',
      args: [],
    );
  }

  /// `History`
  String get gecmis {
    return Intl.message(
      'History',
      name: 'gecmis',
      desc: 'History label',
      args: [],
    );
  }

  /// `Turkish`
  String get turkce {
    return Intl.message(
      'Turkish',
      name: 'turkce',
      desc: 'Turkish language label',
      args: [],
    );
  }

  /// `English`
  String get ingilizce {
    return Intl.message(
      'English',
      name: 'ingilizce',
      desc: 'English language label',
      args: [],
    );
  }

  /// `Arabic`
  String get arapca {
    return Intl.message(
      'Arabic',
      name: 'arapca',
      desc: 'Arabic language label',
      args: [],
    );
  }

  /// `WARNING !`
  String get uyari {
    return Intl.message(
      'WARNING !',
      name: 'uyari',
      desc: 'Warning label',
      args: [],
    );
  }

  /// `For better results, please close and reopen the application.`
  String get daha_verimli_sonuc {
    return Intl.message(
      'For better results, please close and reopen the application.',
      name: 'daha_verimli_sonuc',
      desc: 'For better results, please close and reopen the application',
      args: [],
    );
  }

  /// `I Understand`
  String get anladim {
    return Intl.message(
      'I Understand',
      name: 'anladim',
      desc: 'I understand button label',
      args: [],
    );
  }

  /// `Our product with code {kod} is handcrafted and made from {materyal}. It is a suitable {tur} for the {ortam} environment. Length: {uzunluk} cm, Width: {genislik} cm.`
  String urun_aciklamasi(
    Object kod,
    Object materyal,
    Object tur,
    Object ortam,
    Object uzunluk,
    Object genislik,
  ) {
    return Intl.message(
      'Our product with code $kod is handcrafted and made from $materyal. It is a suitable $tur for the $ortam environment. Length: $uzunluk cm, Width: $genislik cm.',
      name: 'urun_aciklamasi',
      desc: 'Product description template',
      args: [kod, materyal, tur, ortam, uzunluk, genislik],
    );
  }

  /// `We will provide our online assistant service soon 😊`
  String get cevrimici_asistanlik {
    return Intl.message(
      'We will provide our online assistant service soon 😊',
      name: 'cevrimici_asistanlik',
      desc: 'Online assistant service announcement',
      args: [],
    );
  }

  /// `Recently viewed products`
  String get en_son_gezdigin_urunler {
    return Intl.message(
      'Recently viewed products',
      name: 'en_son_gezdigin_urunler',
      desc: 'Displays the products recently viewed by the user.',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
