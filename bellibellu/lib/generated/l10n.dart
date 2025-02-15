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

  /// `Made of stainless steel. Length: 107 cm, Width: 191 cm.`
  String get urun1 {
    return Intl.message(
      'Made of stainless steel. Length: 107 cm, Width: 191 cm.',
      name: 'urun1',
      desc: '',
      args: [],
    );
  }

  /// `Made of wooden material. Length: 143 cm, Width: 177 cm.`
  String get urun2 {
    return Intl.message(
      'Made of wooden material. Length: 143 cm, Width: 177 cm.',
      name: 'urun2',
      desc: '',
      args: [],
    );
  }

  /// `Metal body, durable and stylish. Length: 160 cm, Width: 105 cm.`
  String get urun3 {
    return Intl.message(
      'Metal body, durable and stylish. Length: 160 cm, Width: 105 cm.',
      name: 'urun3',
      desc: '',
      args: [],
    );
  }

  /// `Plastic coating, lightweight and practical. Length: 198 cm, Width: 158 cm.`
  String get urun4 {
    return Intl.message(
      'Plastic coating, lightweight and practical. Length: 198 cm, Width: 158 cm.',
      name: 'urun4',
      desc: '',
      args: [],
    );
  }

  /// `Made from natural bamboo. Length: 130 cm, Width: 191 cm.`
  String get urun5 {
    return Intl.message(
      'Made from natural bamboo. Length: 130 cm, Width: 191 cm.',
      name: 'urun5',
      desc: '',
      args: [],
    );
  }

  /// `Unbreakable glass surface, elegant design. Length: 115 cm, Width: 175 cm.`
  String get urun6 {
    return Intl.message(
      'Unbreakable glass surface, elegant design. Length: 115 cm, Width: 175 cm.',
      name: 'urun6',
      desc: '',
      args: [],
    );
  }

  /// `Aluminum frame, water-resistant. Length: 142 cm, Width: 160 cm.`
  String get urun7 {
    return Intl.message(
      'Aluminum frame, water-resistant. Length: 142 cm, Width: 160 cm.',
      name: 'urun7',
      desc: '',
      args: [],
    );
  }

  /// `Waterproof metal construction. Length: 180 cm, Width: 140 cm.`
  String get urun8 {
    return Intl.message(
      'Waterproof metal construction. Length: 180 cm, Width: 140 cm.',
      name: 'urun8',
      desc: '',
      args: [],
    );
  }

  /// `Antibacterial surface coating. Length: 120 cm, Width: 150 cm.`
  String get urun9 {
    return Intl.message(
      'Antibacterial surface coating. Length: 120 cm, Width: 150 cm.',
      name: 'urun9',
      desc: '',
      args: [],
    );
  }

  /// `Lightweight and portable. Length: 110 cm, Width: 180 cm.`
  String get urun10 {
    return Intl.message(
      'Lightweight and portable. Length: 110 cm, Width: 180 cm.',
      name: 'urun10',
      desc: '',
      args: [],
    );
  }

  /// `Stylish and modern design. Length: 145 cm, Width: 195 cm.`
  String get urun11 {
    return Intl.message(
      'Stylish and modern design. Length: 145 cm, Width: 195 cm.',
      name: 'urun11',
      desc: '',
      args: [],
    );
  }

  /// `Natural oak wood. Length: 155 cm, Width: 180 cm.`
  String get urun12 {
    return Intl.message(
      'Natural oak wood. Length: 155 cm, Width: 180 cm.',
      name: 'urun12',
      desc: '',
      args: [],
    );
  }

  /// `Double-layered metal frame. Length: 165 cm, Width: 185 cm.`
  String get urun13 {
    return Intl.message(
      'Double-layered metal frame. Length: 165 cm, Width: 185 cm.',
      name: 'urun13',
      desc: '',
      args: [],
    );
  }

  /// `Highly durable plastic. Length: 140 cm, Width: 190 cm.`
  String get urun14 {
    return Intl.message(
      'Highly durable plastic. Length: 140 cm, Width: 190 cm.',
      name: 'urun14',
      desc: '',
      args: [],
    );
  }

  /// `Handcrafted wooden details. Length: 175 cm, Width: 200 cm.`
  String get urun15 {
    return Intl.message(
      'Handcrafted wooden details. Length: 175 cm, Width: 200 cm.',
      name: 'urun15',
      desc: '',
      args: [],
    );
  }

  /// `Reinforced glass surface. Length: 160 cm, Width: 170 cm.`
  String get urun16 {
    return Intl.message(
      'Reinforced glass surface. Length: 160 cm, Width: 170 cm.',
      name: 'urun16',
      desc: '',
      args: [],
    );
  }

  /// `Aluminum coating, modern look. Length: 155 cm, Width: 165 cm.`
  String get urun17 {
    return Intl.message(
      'Aluminum coating, modern look. Length: 155 cm, Width: 165 cm.',
      name: 'urun17',
      desc: '',
      args: [],
    );
  }

  /// `Waterproof special coating. Length: 135 cm, Width: 180 cm.`
  String get urun18 {
    return Intl.message(
      'Waterproof special coating. Length: 135 cm, Width: 180 cm.',
      name: 'urun18',
      desc: '',
      args: [],
    );
  }

  /// `Bacteria-resistant surface. Length: 150 cm, Width: 160 cm.`
  String get urun19 {
    return Intl.message(
      'Bacteria-resistant surface. Length: 150 cm, Width: 160 cm.',
      name: 'urun19',
      desc: '',
      args: [],
    );
  }

  /// `Easy-to-carry lightweight design. Length: 145 cm, Width: 185 cm.`
  String get urun20 {
    return Intl.message(
      'Easy-to-carry lightweight design. Length: 145 cm, Width: 185 cm.',
      name: 'urun20',
      desc: '',
      args: [],
    );
  }

  /// `High-quality plastic material. Length: 110 cm, Width: 170 cm.`
  String get urun21 {
    return Intl.message(
      'High-quality plastic material. Length: 110 cm, Width: 170 cm.',
      name: 'urun21',
      desc: '',
      args: [],
    );
  }

  /// `Scratch-resistant surface. Length: 120 cm, Width: 180 cm.`
  String get urun22 {
    return Intl.message(
      'Scratch-resistant surface. Length: 120 cm, Width: 180 cm.',
      name: 'urun22',
      desc: '',
      args: [],
    );
  }

  /// `Non-slip base structure. Length: 140 cm, Width: 190 cm.`
  String get urun23 {
    return Intl.message(
      'Non-slip base structure. Length: 140 cm, Width: 190 cm.',
      name: 'urun23',
      desc: '',
      args: [],
    );
  }

  /// `Elegant wood-patterned coating. Length: 160 cm, Width: 200 cm.`
  String get urun24 {
    return Intl.message(
      'Elegant wood-patterned coating. Length: 160 cm, Width: 200 cm.',
      name: 'urun24',
      desc: '',
      args: [],
    );
  }

  /// `UV-resistant material. Length: 150 cm, Width: 190 cm.`
  String get urun25 {
    return Intl.message(
      'UV-resistant material. Length: 150 cm, Width: 190 cm.',
      name: 'urun25',
      desc: '',
      args: [],
    );
  }

  /// `Special stone surface coating. Length: 130 cm, Width: 170 cm.`
  String get urun26 {
    return Intl.message(
      'Special stone surface coating. Length: 130 cm, Width: 170 cm.',
      name: 'urun26',
      desc: '',
      args: [],
    );
  }

  /// `Multi-purpose use. Length: 125 cm, Width: 175 cm.`
  String get urun27 {
    return Intl.message(
      'Multi-purpose use. Length: 125 cm, Width: 175 cm.',
      name: 'urun27',
      desc: '',
      args: [],
    );
  }

  /// `Shock-absorbing feature. Length: 145 cm, Width: 180 cm.`
  String get urun28 {
    return Intl.message(
      'Shock-absorbing feature. Length: 145 cm, Width: 180 cm.',
      name: 'urun28',
      desc: '',
      args: [],
    );
  }

  /// `Eco-friendly production. Length: 135 cm, Width: 165 cm.`
  String get urun29 {
    return Intl.message(
      'Eco-friendly production. Length: 135 cm, Width: 165 cm.',
      name: 'urun29',
      desc: '',
      args: [],
    );
  }

  /// `Advanced impact resistance. Length: 155 cm, Width: 185 cm.`
  String get urun30 {
    return Intl.message(
      'Advanced impact resistance. Length: 155 cm, Width: 185 cm.',
      name: 'urun30',
      desc: '',
      args: [],
    );
  }

  /// `Reinforced carbon fiber surface. Length: 140 cm, Width: 175 cm.`
  String get urun31 {
    return Intl.message(
      'Reinforced carbon fiber surface. Length: 140 cm, Width: 175 cm.',
      name: 'urun31',
      desc: '',
      args: [],
    );
  }

  /// `Sound-absorbing coating. Length: 170 cm, Width: 190 cm.`
  String get urun32 {
    return Intl.message(
      'Sound-absorbing coating. Length: 170 cm, Width: 190 cm.',
      name: 'urun32',
      desc: '',
      args: [],
    );
  }

  /// `Easy-to-clean structure. Length: 160 cm, Width: 180 cm.`
  String get urun33 {
    return Intl.message(
      'Easy-to-clean structure. Length: 160 cm, Width: 180 cm.',
      name: 'urun33',
      desc: '',
      args: [],
    );
  }

  /// `Water and dust resistant. Length: 155 cm, Width: 195 cm.`
  String get urun34 {
    return Intl.message(
      'Water and dust resistant. Length: 155 cm, Width: 195 cm.',
      name: 'urun34',
      desc: '',
      args: [],
    );
  }

  /// `Stainless steel frame. Length: 180 cm, Width: 200 cm.`
  String get urun35 {
    return Intl.message(
      'Stainless steel frame. Length: 180 cm, Width: 200 cm.',
      name: 'urun35',
      desc: '',
      args: [],
    );
  }

  /// `Antistatic coated surface. Length: 145 cm, Width: 175 cm.`
  String get urun36 {
    return Intl.message(
      'Antistatic coated surface. Length: 145 cm, Width: 175 cm.',
      name: 'urun36',
      desc: '',
      args: [],
    );
  }

  /// `Soundproof coating. Length: 135 cm, Width: 160 cm.`
  String get urun37 {
    return Intl.message(
      'Soundproof coating. Length: 135 cm, Width: 160 cm.',
      name: 'urun37',
      desc: '',
      args: [],
    );
  }

  /// `Bacteria-free texture. Length: 120 cm, Width: 150 cm.`
  String get urun38 {
    return Intl.message(
      'Bacteria-free texture. Length: 120 cm, Width: 150 cm.',
      name: 'urun38',
      desc: '',
      args: [],
    );
  }

  /// `Rubber-backed bottom surface. Length: 125 cm, Width: 185 cm.`
  String get urun39 {
    return Intl.message(
      'Rubber-backed bottom surface. Length: 125 cm, Width: 185 cm.',
      name: 'urun39',
      desc: '',
      args: [],
    );
  }

  /// `Luxury matte finish. Length: 165 cm, Width: 190 cm.`
  String get urun40 {
    return Intl.message(
      'Luxury matte finish. Length: 165 cm, Width: 190 cm.',
      name: 'urun40',
      desc: '',
      args: [],
    );
  }

  /// `Extra durable form. Length: 110 cm, Width: 175 cm.`
  String get urun41 {
    return Intl.message(
      'Extra durable form. Length: 110 cm, Width: 175 cm.',
      name: 'urun41',
      desc: '',
      args: [],
    );
  }

  /// `Wide range of applications. Length: 150 cm, Width: 180 cm.`
  String get urun42 {
    return Intl.message(
      'Wide range of applications. Length: 150 cm, Width: 180 cm.',
      name: 'urun42',
      desc: '',
      args: [],
    );
  }

  /// `High-temperature resistance. Length: 175 cm, Width: 200 cm.`
  String get urun43 {
    return Intl.message(
      'High-temperature resistance. Length: 175 cm, Width: 200 cm.',
      name: 'urun43',
      desc: '',
      args: [],
    );
  }

  /// `Self-cleaning feature. Length: 155 cm, Width: 180 cm.`
  String get urun44 {
    return Intl.message(
      'Self-cleaning feature. Length: 155 cm, Width: 180 cm.',
      name: 'urun44',
      desc: '',
      args: [],
    );
  }

  /// `Ultra-light carbon body. Length: 130 cm, Width: 170 cm.`
  String get urun45 {
    return Intl.message(
      'Ultra-light carbon body. Length: 130 cm, Width: 170 cm.',
      name: 'urun45',
      desc: '',
      args: [],
    );
  }

  /// `High resistance to impacts. Length: 165 cm, Width: 195 cm.`
  String get urun46 {
    return Intl.message(
      'High resistance to impacts. Length: 165 cm, Width: 195 cm.',
      name: 'urun46',
      desc: '',
      args: [],
    );
  }

  /// `Durable polymer coating. Length: 145 cm, Width: 175 cm.`
  String get urun47 {
    return Intl.message(
      'Durable polymer coating. Length: 145 cm, Width: 175 cm.',
      name: 'urun47',
      desc: '',
      args: [],
    );
  }

  /// `Reinforced screw connections. Length: 125 cm, Width: 160 cm.`
  String get urun48 {
    return Intl.message(
      'Reinforced screw connections. Length: 125 cm, Width: 160 cm.',
      name: 'urun48',
      desc: '',
      args: [],
    );
  }

  /// `Magnetic lock mechanism. Length: 135 cm, Width: 185 cm.`
  String get urun49 {
    return Intl.message(
      'Magnetic lock mechanism. Length: 135 cm, Width: 185 cm.',
      name: 'urun49',
      desc: '',
      args: [],
    );
  }

  /// `Special vibration-absorbing design. Length: 180 cm, Width: 200 cm.`
  String get urun50 {
    return Intl.message(
      'Special vibration-absorbing design. Length: 180 cm, Width: 200 cm.',
      name: 'urun50',
      desc: '',
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
      desc: 'Message when the favorite product list is empty',
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
