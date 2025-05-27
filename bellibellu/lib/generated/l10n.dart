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

  /// `The warranty period of the products is {garanti_suresi} year.`
  String urunlerin_garanti_suresi(Object garanti_suresi) {
    return Intl.message(
      'The warranty period of the products is $garanti_suresi year.',
      name: 'urunlerin_garanti_suresi',
      desc: 'Product warranty period information',
      args: [garanti_suresi],
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

  /// `Product Reviews`
  String get baslikDegerlendirme {
    return Intl.message(
      'Product Reviews',
      name: 'baslikDegerlendirme',
      desc: '',
      args: [],
    );
  }

  /// `See All ({adet})`
  String tumunuGorButonu(Object adet) {
    return Intl.message(
      'See All ($adet)',
      name: 'tumunuGorButonu',
      desc: '',
      args: [adet],
    );
  }

  /// `{puan} Points | {yorumSayisi} Reviews`
  String puanYorumMetni(Object puan, Object yorumSayisi) {
    return Intl.message(
      '$puan Points | $yorumSayisi Reviews',
      name: 'puanYorumMetni',
      desc: '',
      args: [puan, yorumSayisi],
    );
  }

  /// `Seller: {satici}`
  String saticiMetni(Object satici) {
    return Intl.message(
      'Seller: $satici',
      name: 'saticiMetni',
      desc: '',
      args: [satici],
    );
  }

  /// `{puan} points & {yorumSayisi} reviews`
  String puan_yorum(Object puan, Object yorumSayisi) {
    return Intl.message(
      '$puan points & $yorumSayisi reviews',
      name: 'puan_yorum',
      desc: '',
      args: [puan, yorumSayisi],
    );
  }

  /// `Recommended Order`
  String get onerilen_siralama {
    return Intl.message(
      'Recommended Order',
      name: 'onerilen_siralama',
      desc: '',
      args: [],
    );
  }

  /// `Newest to Oldest`
  String get yeniden_eskiye {
    return Intl.message(
      'Newest to Oldest',
      name: 'yeniden_eskiye',
      desc: '',
      args: [],
    );
  }

  /// `Oldest to Newest`
  String get eskiden_yeniye {
    return Intl.message(
      'Oldest to Newest',
      name: 'eskiden_yeniye',
      desc: '',
      args: [],
    );
  }

  /// `Highest Rating`
  String get azalan_puan {
    return Intl.message(
      'Highest Rating',
      name: 'azalan_puan',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Rating`
  String get artan_puan {
    return Intl.message(
      'Lowest Rating',
      name: 'artan_puan',
      desc: '',
      args: [],
    );
  }

  /// `Seller: {satici}`
  String satici_bilgisi(Object satici) {
    return Intl.message(
      'Seller: $satici',
      name: 'satici_bilgisi',
      desc: '',
      args: [satici],
    );
  }

  /// `Q&A ({adet})`
  String soru_cevap(Object adet) {
    return Intl.message(
      'Q&A ($adet)',
      name: 'soru_cevap',
      desc: '',
      args: [adet],
    );
  }

  /// `Add to Cart`
  String get sepete_ekle {
    return Intl.message('Add to Cart', name: 'sepete_ekle', desc: '', args: []);
  }

  /// `Ask a Question`
  String get soru_sor {
    return Intl.message('Ask a Question', name: 'soru_sor', desc: '', args: []);
  }

  /// `My Cart`
  String get sepetim {
    return Intl.message('My Cart', name: 'sepetim', desc: '', args: []);
  }

  /// `Quantity`
  String get adet {
    return Intl.message('Quantity', name: 'adet', desc: '', args: []);
  }

  /// `Total`
  String get toplam {
    return Intl.message('Total', name: 'toplam', desc: '', args: []);
  }

  /// `Confirm Cart`
  String get sepeti_onayla {
    return Intl.message(
      'Confirm Cart',
      name: 'sepeti_onayla',
      desc: '',
      args: [],
    );
  }

  /// `My Cart - {urunSayisi} items`
  String sepetim_baslik(Object urunSayisi) {
    return Intl.message(
      'My Cart - $urunSayisi items',
      name: 'sepetim_baslik',
      desc: '',
      args: [urunSayisi],
    );
  }

  /// `{urun} x{adet}`
  String sepetteki_urun(Object urun, Object adet) {
    return Intl.message(
      '$urun x$adet',
      name: 'sepetteki_urun',
      desc: '',
      args: [urun, adet],
    );
  }

  /// `Cart Details`
  String get sepet_detayi {
    return Intl.message(
      'Cart Details',
      name: 'sepet_detayi',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get ara_toplam {
    return Intl.message('Subtotal', name: 'ara_toplam', desc: '', args: []);
  }

  /// `Shipping`
  String get kargo {
    return Intl.message('Shipping', name: 'kargo', desc: '', args: []);
  }

  /// `Discount`
  String get indirim {
    return Intl.message('Discount', name: 'indirim', desc: '', args: []);
  }

  /// `Total: {fiyat} TL`
  String toplam_fiyat(Object fiyat) {
    return Intl.message(
      'Total: $fiyat TL',
      name: 'toplam_fiyat',
      desc: '',
      args: [fiyat],
    );
  }

  /// `Hello, {kullanici}`
  String merhaba_kullanici(Object kullanici) {
    return Intl.message(
      'Hello, $kullanici',
      name: 'merhaba_kullanici',
      desc: '',
      args: [kullanici],
    );
  }

  /// `Orders`
  String get siparisler {
    return Intl.message('Orders', name: 'siparisler', desc: '', args: []);
  }

  /// `Buy Again`
  String get tekrar_satin_al {
    return Intl.message(
      'Buy Again',
      name: 'tekrar_satin_al',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get hesap {
    return Intl.message('Account', name: 'hesap', desc: '', args: []);
  }

  /// `Lists`
  String get listeler {
    return Intl.message('Lists', name: 'listeler', desc: '', args: []);
  }

  /// `Settings`
  String get ayarlar {
    return Intl.message('Settings', name: 'ayarlar', desc: '', args: []);
  }

  /// `Notifications`
  String get bildirimler {
    return Intl.message(
      'Notifications',
      name: 'bildirimler',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get dil_secimi {
    return Intl.message('Language', name: 'dil_secimi', desc: '', args: []);
  }

  /// `EN`
  String get turkce_kodu {
    return Intl.message('EN', name: 'turkce_kodu', desc: '', args: []);
  }

  /// `Seller`
  String get satici {
    return Intl.message('Seller', name: 'satici', desc: '', args: []);
  }

  /// `Customer`
  String get musteri {
    return Intl.message('Customer', name: 'musteri', desc: '', args: []);
  }

  /// `Login`
  String get giris_yap {
    return Intl.message('Login', name: 'giris_yap', desc: '', args: []);
  }

  /// `Sign Up`
  String get kayit_ol {
    return Intl.message('Sign Up', name: 'kayit_ol', desc: '', args: []);
  }

  /// `Welcome Back!`
  String get tekrar_hosgeldiniz {
    return Intl.message(
      'Welcome Back!',
      name: 'tekrar_hosgeldiniz',
      desc: '',
      args: [],
    );
  }

  /// `Welcome!`
  String get hosgeldiniz {
    return Intl.message('Welcome!', name: 'hosgeldiniz', desc: '', args: []);
  }

  /// `Your Name and Surname`
  String get ad_soyad {
    return Intl.message(
      'Your Name and Surname',
      name: 'ad_soyad',
      desc: '',
      args: [],
    );
  }

  /// `ID Number (optional)`
  String get id_numarasi {
    return Intl.message(
      'ID Number (optional)',
      name: 'id_numarasi',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your Password`
  String get sifre {
    return Intl.message(
      'Enter your Password',
      name: 'sifre',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get devam_google {
    return Intl.message(
      'Continue with Google',
      name: 'devam_google',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get veya {
    return Intl.message('or', name: 'veya', desc: '', args: []);
  }

  /// `By clicking Sign Up, you accept the `
  String get kvkk_onay {
    return Intl.message(
      'By clicking Sign Up, you accept the ',
      name: 'kvkk_onay',
      desc: '',
      args: [],
    );
  }

  /// `Personal Data Protection Law`
  String get kvkk {
    return Intl.message(
      'Personal Data Protection Law',
      name: 'kvkk',
      desc: '',
      args: [],
    );
  }

  /// ` and the `
  String get ve {
    return Intl.message(' and the ', name: 've', desc: '', args: []);
  }

  /// `Membership Agreement`
  String get uyelik_sozlesmesi {
    return Intl.message(
      'Membership Agreement',
      name: 'uyelik_sozlesmesi',
      desc: '',
      args: [],
    );
  }

  /// `.`
  String get kabul_ettiniz {
    return Intl.message('.', name: 'kabul_ettiniz', desc: '', args: []);
  }

  /// `Date of Birth`
  String get dogum_tarihi {
    return Intl.message(
      'Date of Birth',
      name: 'dogum_tarihi',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get baslik_siparislerim {
    return Intl.message(
      'My Orders',
      name: 'baslik_siparislerim',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get filtre_tumu {
    return Intl.message('All', name: 'filtre_tumu', desc: '', args: []);
  }

  /// `This Month`
  String get filtre_bu_ay {
    return Intl.message('This Month', name: 'filtre_bu_ay', desc: '', args: []);
  }

  /// `Last Month`
  String get filtre_gecen_ay {
    return Intl.message(
      'Last Month',
      name: 'filtre_gecen_ay',
      desc: '',
      args: [],
    );
  }

  /// `Search product or brand`
  String get arama_ipucu {
    return Intl.message(
      'Search product or brand',
      name: 'arama_ipucu',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get teslim_edildi {
    return Intl.message('Delivered', name: 'teslim_edildi', desc: '', args: []);
  }

  /// `Review`
  String get degerlendir {
    return Intl.message('Review', name: 'degerlendir', desc: '', args: []);
  }

  /// `Details`
  String get detaylar {
    return Intl.message('Details', name: 'detaylar', desc: '', args: []);
  }

  /// `Order Details`
  String get sayfa_baslik {
    return Intl.message(
      'Order Details',
      name: 'sayfa_baslik',
      desc: '',
      args: [],
    );
  }

  /// `Order No`
  String get siparis_no {
    return Intl.message('Order No', name: 'siparis_no', desc: '', args: []);
  }

  /// `Order Date`
  String get siparis_tarihi {
    return Intl.message(
      'Order Date',
      name: 'siparis_tarihi',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get siparis_ozeti {
    return Intl.message(
      'Order Summary',
      name: 'siparis_ozeti',
      desc: '',
      args: [],
    );
  }

  /// `Order Detail`
  String get siparis_detayi {
    return Intl.message(
      'Order Detail',
      name: 'siparis_detayi',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Delivery`
  String get tahmini_teslimat {
    return Intl.message(
      'Estimated Delivery',
      name: 'tahmini_teslimat',
      desc: '',
      args: [],
    );
  }

  /// `Delivery No`
  String get teslimat_no {
    return Intl.message('Delivery No', name: 'teslimat_no', desc: '', args: []);
  }

  /// `Rate Seller`
  String get satici_degerlendir {
    return Intl.message(
      'Rate Seller',
      name: 'satici_degerlendir',
      desc: '',
      args: [],
    );
  }

  /// `Follow Seller`
  String get satici_takip_et {
    return Intl.message(
      'Follow Seller',
      name: 'satici_takip_et',
      desc: '',
      args: [],
    );
  }

  /// `The following {adet} item(s) were delivered on {tarih}.`
  String teslimat_bilgisi(Object adet, Object tarih) {
    return Intl.message(
      'The following $adet item(s) were delivered on $tarih.',
      name: 'teslimat_bilgisi',
      desc: '',
      args: [adet, tarih],
    );
  }

  /// `Shipping Company`
  String get kargo_firmasi {
    return Intl.message(
      'Shipping Company',
      name: 'kargo_firmasi',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Details`
  String get teslimat_detay {
    return Intl.message(
      'Delivery Details',
      name: 'teslimat_detay',
      desc: '',
      args: [],
    );
  }

  /// `Rate Product`
  String get urun_degerlendir {
    return Intl.message(
      'Rate Product',
      name: 'urun_degerlendir',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get teslimat_adresi {
    return Intl.message(
      'Delivery Address',
      name: 'teslimat_adresi',
      desc: '',
      args: [],
    );
  }

  /// `Recipient`
  String get alici {
    return Intl.message('Recipient', name: 'alici', desc: '', args: []);
  }

  /// `**** **** {kart} - Single Payment`
  String siparis_odeme(Object kart) {
    return Intl.message(
      '**** **** $kart - Single Payment',
      name: 'siparis_odeme',
      desc: '',
      args: [kart],
    );
  }

  /// `Free shipping for orders above 200 TL`
  String get kargo_bedava {
    return Intl.message(
      'Free shipping for orders above 200 TL',
      name: 'kargo_bedava',
      desc: '',
      args: [],
    );
  }

  /// `Contact Seller`
  String get satici_iletisim {
    return Intl.message(
      'Contact Seller',
      name: 'satici_iletisim',
      desc: '',
      args: [],
    );
  }

  /// `View Invoice`
  String get fatura_goruntule {
    return Intl.message(
      'View Invoice',
      name: 'fatura_goruntule',
      desc: '',
      args: [],
    );
  }

  /// `Payment Information`
  String get odeme_bilgisi {
    return Intl.message(
      'Payment Information',
      name: 'odeme_bilgisi',
      desc: '',
      args: [],
    );
  }

  /// `My Seller Messages`
  String get satici_mesajlarim {
    return Intl.message(
      'My Seller Messages',
      name: 'satici_mesajlarim',
      desc: '',
      args: [],
    );
  }

  /// `Product Questions`
  String get urun_sorularim {
    return Intl.message(
      'Product Questions',
      name: 'urun_sorularim',
      desc: '',
      args: [],
    );
  }

  /// `Order Questions`
  String get siparis_sorularim {
    return Intl.message(
      'Order Questions',
      name: 'siparis_sorularim',
      desc: '',
      args: [],
    );
  }

  /// `(0 Unread Question)`
  String get okunmamis_soru {
    return Intl.message(
      '(0 Unread Question)',
      name: 'okunmamis_soru',
      desc: '',
      args: [],
    );
  }

  /// `(0 Unread Message)`
  String get okunmamis_mesaj {
    return Intl.message(
      '(0 Unread Message)',
      name: 'okunmamis_mesaj',
      desc: '',
      args: [],
    );
  }

  /// `You have no product questions yet`
  String get urun_soru_yok {
    return Intl.message(
      'You have no product questions yet',
      name: 'urun_soru_yok',
      desc: '',
      args: [],
    );
  }

  /// `Continue Shopping`
  String get alisverise_devam_et {
    return Intl.message(
      'Continue Shopping',
      name: 'alisverise_devam_et',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get konu {
    return Intl.message('Subject', name: 'konu', desc: '', args: []);
  }

  /// `Delivery Status`
  String get teslimat_durumu {
    return Intl.message(
      'Delivery Status',
      name: 'teslimat_durumu',
      desc: '',
      args: [],
    );
  }

  /// `Will be shipped shortly`
  String get kargo_verilecek {
    return Intl.message(
      'Will be shipped shortly',
      name: 'kargo_verilecek',
      desc: '',
      args: [],
    );
  }

  /// `The product will be in stock tomorrow`
  String get stok_yarin {
    return Intl.message(
      'The product will be in stock tomorrow',
      name: 'stok_yarin',
      desc: '',
      args: [],
    );
  }

  /// `Type your message...`
  String get mesaj_yazin {
    return Intl.message(
      'Type your message...',
      name: 'mesaj_yazin',
      desc: '',
      args: [],
    );
  }

  /// `When will my order be shipped? I placed it yesterday, and it was supposed to ship by today.`
  String get soru_kargo_ne_zaman {
    return Intl.message(
      'When will my order be shipped? I placed it yesterday, and it was supposed to ship by today.',
      name: 'soru_kargo_ne_zaman',
      desc: '',
      args: [],
    );
  }

  /// `Will I get a notification when it is shipped?`
  String get soru_bildirim {
    return Intl.message(
      'Will I get a notification when it is shipped?',
      name: 'soru_bildirim',
      desc: '',
      args: [],
    );
  }

  /// `It will be shipped shortly`
  String get yanit_kargo_verilecek {
    return Intl.message(
      'It will be shipped shortly',
      name: 'yanit_kargo_verilecek',
      desc: '',
      args: [],
    );
  }

  /// `Yes, the system sends a notification automatically.`
  String get yanit_sistem_bildirim {
    return Intl.message(
      'Yes, the system sends a notification automatically.',
      name: 'yanit_sistem_bildirim',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get gonder {
    return Intl.message('Send', name: 'gonder', desc: '', args: []);
  }

  /// `Incorrect password or email address`
  String get hataliSifreVeyaMail {
    return Intl.message(
      'Incorrect password or email address',
      name: 'hataliSifreVeyaMail',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get duzenle {
    return Intl.message('Edit', name: 'duzenle', desc: '', args: []);
  }

  /// `Password`
  String get sifreb {
    return Intl.message('Password', name: 'sifreb', desc: '', args: []);
  }

  /// `Address`
  String get adres {
    return Intl.message('Address', name: 'adres', desc: '', args: []);
  }

  /// `Silver`
  String get renk_gumus {
    return Intl.message('Silver', name: 'renk_gumus', desc: '', args: []);
  }

  /// `Brown`
  String get renk_kahverengi {
    return Intl.message('Brown', name: 'renk_kahverengi', desc: '', args: []);
  }

  /// `Gray`
  String get renk_gri {
    return Intl.message('Gray', name: 'renk_gri', desc: '', args: []);
  }

  /// `Black`
  String get renk_siyah {
    return Intl.message('Black', name: 'renk_siyah', desc: '', args: []);
  }

  /// `Beige`
  String get renk_bej {
    return Intl.message('Beige', name: 'renk_bej', desc: '', args: []);
  }

  /// `Navy`
  String get renk_lacivert {
    return Intl.message('Navy', name: 'renk_lacivert', desc: '', args: []);
  }

  /// `White`
  String get renk_beyaz {
    return Intl.message('White', name: 'renk_beyaz', desc: '', args: []);
  }

  /// `Blue`
  String get renk_mavi {
    return Intl.message('Blue', name: 'renk_mavi', desc: '', args: []);
  }

  /// `Green`
  String get renk_yesil {
    return Intl.message('Green', name: 'renk_yesil', desc: '', args: []);
  }

  /// `Yellow`
  String get renk_sari {
    return Intl.message('Yellow', name: 'renk_sari', desc: '', args: []);
  }

  /// `Maroon`
  String get renk_bordo {
    return Intl.message('Maroon', name: 'renk_bordo', desc: '', args: []);
  }

  /// `Orange`
  String get renk_turuncu {
    return Intl.message('Orange', name: 'renk_turuncu', desc: '', args: []);
  }

  /// `Red`
  String get renk_kirmizi {
    return Intl.message('Red', name: 'renk_kirmizi', desc: '', args: []);
  }

  /// `Shipping Fee`
  String get kargo_ucreti {
    return Intl.message(
      'Shipping Fee',
      name: 'kargo_ucreti',
      desc: '',
      args: [],
    );
  }

  /// `Added to cart`
  String get sepete_eklendi {
    return Intl.message(
      'Added to cart',
      name: 'sepete_eklendi',
      desc: '',
      args: [],
    );
  }

  /// `sent`
  String get mesajDurumuGonderildi {
    return Intl.message(
      'sent',
      name: 'mesajDurumuGonderildi',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get hataOlustu {
    return Intl.message(
      'An error occurred',
      name: 'hataOlustu',
      desc: '',
      args: [],
    );
  }

  /// `Enter Card Information`
  String get kartBilgisiGir {
    return Intl.message(
      'Enter Card Information',
      name: 'kartBilgisiGir',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get kartNumarasi {
    return Intl.message(
      'Card Number',
      name: 'kartNumarasi',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid card number.`
  String get gecersizKartUyarisi {
    return Intl.message(
      'Please enter a valid card number.',
      name: 'gecersizKartUyarisi',
      desc: '',
      args: [],
    );
  }

  /// `Please select a product from the cart`
  String get lutfenSepettenUrunSecin {
    return Intl.message(
      'Please select a product from the cart',
      name: 'lutfenSepettenUrunSecin',
      desc: '',
      args: [],
    );
  }

  /// `Operation successful`
  String get islem_basarili {
    return Intl.message(
      'Operation successful',
      name: 'islem_basarili',
      desc: '',
      args: [],
    );
  }

  /// `Address information is missing, please enter your address.`
  String get adresEksik {
    return Intl.message(
      'Address information is missing, please enter your address.',
      name: 'adresEksik',
      desc: '',
      args: [],
    );
  }

  /// `{0} Delivery, {1} Product`
  String teslimatUrunSayisi(Object adetTeslimat, Object adetUrun) {
    return Intl.message(
      '{0} Delivery, {1} Product',
      name: 'teslimatUrunSayisi',
      desc: 'Shows number of deliveries and products',
      args: [adetTeslimat, adetUrun],
    );
  }

  /// `Pending`
  String get bekliyor {
    return Intl.message('Pending', name: 'bekliyor', desc: '', args: []);
  }

  /// `Cart is empty`
  String get sepetBos {
    return Intl.message('Cart is empty', name: 'sepetBos', desc: '', args: []);
  }

  /// `No past orders`
  String get gecmisBos {
    return Intl.message(
      'No past orders',
      name: 'gecmisBos',
      desc: '',
      args: [],
    );
  }

  /// `Packages`
  String get takimlar {
    return Intl.message('Packages', name: 'takimlar', desc: '', args: []);
  }

  /// `Package Code`
  String get takimKodu {
    return Intl.message('Package Code', name: 'takimKodu', desc: '', args: []);
  }

  /// `Table Name`
  String get masaAdi {
    return Intl.message('Table Name', name: 'masaAdi', desc: '', args: []);
  }

  /// `Chair Name`
  String get sandalyeAdi {
    return Intl.message('Chair Name', name: 'sandalyeAdi', desc: '', args: []);
  }

  /// `Table Seller`
  String get masaSatici {
    return Intl.message('Table Seller', name: 'masaSatici', desc: '', args: []);
  }

  /// `Chair Seller`
  String get sandalyeSatici {
    return Intl.message(
      'Chair Seller',
      name: 'sandalyeSatici',
      desc: '',
      args: [],
    );
  }

  /// `Number of Chairs`
  String get sandalyeSayisi {
    return Intl.message(
      'Number of Chairs',
      name: 'sandalyeSayisi',
      desc: '',
      args: [],
    );
  }

  /// `Packages list is empty`
  String get takimListesiBos {
    return Intl.message(
      'Packages list is empty',
      name: 'takimListesiBos',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment`
  String get yorumEkle {
    return Intl.message('Add Comment', name: 'yorumEkle', desc: '', args: []);
  }

  /// `My Products`
  String get urunlerim {
    return Intl.message('My Products', name: 'urunlerim', desc: '', args: []);
  }

  /// `Analytics`
  String get analiz {
    return Intl.message('Analytics', name: 'analiz', desc: '', args: []);
  }

  /// `No published product`
  String get yayinlananUrunYok {
    return Intl.message(
      'No published product',
      name: 'yayinlananUrunYok',
      desc: '',
      args: [],
    );
  }

  /// `Number of Likes`
  String get begeniSayisi {
    return Intl.message(
      'Number of Likes',
      name: 'begeniSayisi',
      desc: '',
      args: [],
    );
  }

  /// `Published Products`
  String get yayinlananUrunSayisi {
    return Intl.message(
      'Published Products',
      name: 'yayinlananUrunSayisi',
      desc: '',
      args: [],
    );
  }

  /// `Total Sales Count`
  String get toplamSatisSayisi {
    return Intl.message(
      'Total Sales Count',
      name: 'toplamSatisSayisi',
      desc: '',
      args: [],
    );
  }

  /// `Total Sales Amount`
  String get toplamSatisMiktari {
    return Intl.message(
      'Total Sales Amount',
      name: 'toplamSatisMiktari',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling Product`
  String get enCokSatilanUrun {
    return Intl.message(
      'Best Selling Product',
      name: 'enCokSatilanUrun',
      desc: '',
      args: [],
    );
  }

  /// `Most Liked Product`
  String get enCokBegenilenUrun {
    return Intl.message(
      'Most Liked Product',
      name: 'enCokBegenilenUrun',
      desc: '',
      args: [],
    );
  }

  /// `Latest Activity Information`
  String get enSonFaaliyetBilgileri {
    return Intl.message(
      'Latest Activity Information',
      name: 'enSonFaaliyetBilgileri',
      desc: '',
      args: [],
    );
  }

  /// `Number of Sales`
  String get satilmaSayisi {
    return Intl.message(
      'Number of Sales',
      name: 'satilmaSayisi',
      desc: '',
      args: [],
    );
  }

  /// `Product Image`
  String get urunResmi {
    return Intl.message('Product Image', name: 'urunResmi', desc: '', args: []);
  }

  /// `Water Resistant?`
  String get suyaDayanikliMi {
    return Intl.message(
      'Water Resistant?',
      name: 'suyaDayanikliMi',
      desc: '',
      args: [],
    );
  }

  /// `Warranty Period`
  String get garantiSuresi {
    return Intl.message(
      'Warranty Period',
      name: 'garantiSuresi',
      desc: '',
      args: [],
    );
  }

  /// `Stock Status`
  String get stokDurumu {
    return Intl.message('Stock Status', name: 'stokDurumu', desc: '', args: []);
  }

  /// `Product Name`
  String get urunAdi {
    return Intl.message('Product Name', name: 'urunAdi', desc: '', args: []);
  }

  /// `Color`
  String get renk {
    return Intl.message('Color', name: 'renk', desc: '', args: []);
  }

  /// `Width`
  String get genislik {
    return Intl.message('Width', name: 'genislik', desc: '', args: []);
  }

  /// `Length`
  String get uzunluk {
    return Intl.message('Length', name: 'uzunluk', desc: '', args: []);
  }

  /// `Add Product`
  String get urunEkleme {
    return Intl.message('Add Product', name: 'urunEkleme', desc: '', args: []);
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
