import 'package:bellibellu/dildestegiProvaider.dart';
import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/logosayfasi.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarVT.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:bellibellu/services/veritabani.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  DateTime selectedDate = DateTime.now();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final TextEditingController _adsoyadController = TextEditingController();
  final TextEditingController _dogumtarihiController = TextEditingController();
  bool isLogin = true;
  bool isSatici = true;
  bool girisyapildimi = false;
  String girisyapanmail = '';
  String secilendil = "";

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Renkler.kahverengi, // Başlık ve seçili gün rengi
              onPrimary: Colors.white, // Başlık yazı rengi
              onSurface: Colors.black, // Takvim gün yazıları
            ),
            dialogBackgroundColor: Renkler.kuyubeyaz, // Arka plan rengi
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dogumtarihiController.text = DateFormat('dd.MM.yyyy').format(picked);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dogumtarihiController.text = DateFormat('dd.MM.yyyy').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              // 🔹 Background Image
              Container(
                height: MediaQuery.of(context).size.height / 2 + 115,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Renkler.kahverengi,
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/ozelkatagori.png',
                    ), // Arka plan resmi
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 🔹 Sliding Panel
              DraggableScrollableSheet(
                initialChildSize: 0.5,
                minChildSize: 0.4,
                maxChildSize: 0.75,
                builder: (context, scrollController) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      color: Renkler.kuyubeyaz,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔘 Tabs
                          SizedBox(height: 15),
                          Center(
                            child: Container(
                              width: 350,
                              height: 40,
                              decoration: BoxDecoration(
                                color:
                                    Renkler.krem, // Arka plan rengi (gri ton)
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  // Giriş Yap
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:
                                          () => setState(() => isSatici = true),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              isSatici
                                                  ? Renkler.kahverengi
                                                  : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          border:
                                              isSatici
                                                  ? Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1,
                                                  )
                                                  : null,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          S.of(context).satici,
                                          style: TextStyle(
                                            color:
                                                isSatici
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Kayıt Ol
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:
                                          () =>
                                              setState(() => isSatici = false),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              !isSatici
                                                  ? Renkler.kahverengi
                                                  : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          border:
                                              !isSatici
                                                  ? Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1,
                                                  )
                                                  : null,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          S.of(context).musteri,
                                          style: TextStyle(
                                            color:
                                                !isSatici
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: 350,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Renkler.krem,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  // Giriş Yap
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:
                                          () => setState(() => isLogin = true),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              isLogin
                                                  ? Renkler.kahverengi
                                                  : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          border:
                                              isLogin
                                                  ? Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1,
                                                  )
                                                  : null,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          S.of(context).giris_yap,
                                          style: TextStyle(
                                            color:
                                                isLogin
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  // Kayıt Ol
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:
                                          () => setState(() => isLogin = false),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              !isLogin
                                                  ? Renkler.kahverengi
                                                  : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          border:
                                              !isLogin
                                                  ? Border.all(
                                                    color: Colors.grey.shade300,
                                                    width: 1,
                                                  )
                                                  : null,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          S.of(context).kayit_ol,
                                          style: TextStyle(
                                            color:
                                                !isLogin
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            isLogin
                                ? S.of(context).tekrar_hosgeldiniz
                                : S.of(context).hosgeldiniz,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Renkler.kahverengi,
                            ),
                          ),
                          const SizedBox(height: 16),

                          if (!isLogin)
                            TextField(
                              cursorColor: Renkler.kahverengi,

                              controller: _adsoyadController,

                              decoration: InputDecoration(
                                focusColor: Renkler.kahverengi,
                                fillColor: Renkler.kahverengi,
                                labelText: S.of(context).ad_soyad,

                                border: OutlineInputBorder(),
                                floatingLabelStyle: TextStyle(
                                  color: Renkler.kahverengi,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Renkler.kahverengi,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          if (!isLogin) const SizedBox(height: 12),
                          if (!isLogin && !isSatici)
                            _customField(
                              hint: S.of(context).dogum_tarihi,
                              controller: _dogumtarihiController,
                              icon: Icons.calendar_month_outlined,
                              onTap: _selectDate,
                            ),
                          if (!isLogin) const SizedBox(height: 12),

                          TextField(
                            cursorColor: Renkler.kahverengi,
                            controller: _mailController,
                            decoration: InputDecoration(
                              labelText: S.of(context).email,
                              border: OutlineInputBorder(),
                              floatingLabelStyle: TextStyle(
                                color: Renkler.kahverengi,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Renkler.kahverengi,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          TextField(
                            controller: _sifreController,
                            cursorColor: Renkler.kahverengi,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: S.of(context).sifre,
                              border: OutlineInputBorder(),
                              floatingLabelStyle: TextStyle(
                                color: Renkler.kahverengi,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Renkler.kahverengi,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Renkler.kahverengi,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ), // köşe yuvarlama
                                ),
                              ),
                              onPressed: () async {
                                if (!isLogin) {
                                  if (isSatici) {
                                    await _saticikayitEkle();
                                  } else {
                                    await _musterikayitEkle();
                                  }
                                } else {
                                  if (isSatici) {
                                    await saticigirisYap(context);
                                  } else {
                                    await musterigirisYap(context);
                                  }
                                }
                              },
                              child: Text(
                                isLogin
                                    ? S.of(context).giris_yap
                                    : S.of(context).kayit_ol,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: Color(
                                    0xFFE0E0E0,
                                  ), // açık gri çizgi rengi
                                  endIndent: 12,
                                ),
                              ),
                              Text(
                                S.of(context).veya,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xFFE0E0E0),
                                  indent: 12,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: OutlinedButton.icon(
                              icon: Image.asset('assets/google.png'),
                              label: Text(
                                S.of(context).devam_google,
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () async {
                                // final userCredential = await signInWithGoogle();
                                // if (userCredential != null) {
                                //   print(
                                //     'Giriş Başarılı: ${userCredential.user?.displayName}',
                                //   );
                                //   context.push(Paths.hareketler);
                                // } else {
                                //   print('Giriş iptal edildi veya hata oluştu');
                                // }
                              },
                            ),
                          ),

                          const SizedBox(height: 16),

                          if (!isLogin)
                            Text.rich(
                              TextSpan(
                                text: S.of(context).kvkk_onay,
                                children: [
                                  TextSpan(
                                    text: S.of(context).kvkk,
                                    style: TextStyle(color: Renkler.kahverengi),
                                  ),
                                  TextSpan(text: S.of(context).ve),
                                  TextSpan(
                                    text: S.of(context).uyelik_sozlesmesi,
                                    style: TextStyle(color: Renkler.kahverengi),
                                  ),
                                  TextSpan(text: S.of(context).kabul_ettiniz),
                                ],
                              ),
                              style: TextStyle(fontSize: 12),
                            ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                top: 80,
                right: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(color: Renkler.krem),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        dilsecimdialogu(context);
                      },
                      child: Text(
                        S.of(context).turkce_kodu,
                        style: TextStyle(color: Renkler.kahverengi),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Provider.of<Loadingprovider>(context, listen: false).isloading
            ? Center(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(83, 138, 103, 32),
                ),
                child: Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(color: Renkler.kahverengi),
                  ),
                ),
              ),
            )
            : SizedBox(),
      ],
    );
  }

  Future<void> saticigirisYap(BuildContext context) async {
    Provider.of<Loadingprovider>(context, listen: false).changemode();
    bool kontrol = await Kullanicilarvt.saticibilgikontrolu(
      _mailController.text,
      _sifreController.text,
    );
    if (!kontrol) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).hataliSifreVeyaMail,
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    } else {
      girisyapanmail = _mailController.text;
      girisyapildimi = true;

      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici = await Kullanicilarvt.getsaticiBymail(
        _mailController.text,
      );
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri =
          false;
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).degisikliklerikaydet();
      cihazagirisbilgisinikaydet();
      context.pushReplacement(Paths.anasayfa);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S
                .of(context)
                .merhaba_kullanici(
                  Provider.of<Kullanicilarprovider>(
                    context,
                    listen: false,
                  ).currentkullanici['adi'],
                ),
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    }
    Provider.of<Loadingprovider>(context, listen: false).changemode();
  }

  Future<void> musterigirisYap(BuildContext context) async {
    bool kontrol = await Kullanicilarvt.musteribilgikontrolu(
      _mailController.text,
      _sifreController.text,
    );
    if (!kontrol) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).hataliSifreVeyaMail,
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    } else {
      girisyapanmail = _mailController.text;
      girisyapildimi = true;
      debugPrint(
        'ismusteri??? :${Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri.toString()}',
      );
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici = await Kullanicilarvt.getmusteriBymail(
        _mailController.text,
      );
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri =
          true;
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).degisikliklerikaydet();
      cihazagirisbilgisinikaydet();
      context.pushReplacement(Paths.anasayfa);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S
                .of(context)
                .merhaba_kullanici(
                  Provider.of<Kullanicilarprovider>(
                    context,
                    listen: false,
                  ).currentkullanici['adi'],
                ),
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    }
  }

  Future<void> _saticikayitEkle() async {
    Provider.of<Loadingprovider>(context, listen: false).changemode();
    List<String> adParcalari = _adsoyadController.text.trim().split(' ');

    String adi = adParcalari[0]; // 'ahmet'
    String soyadi = adParcalari.length > 1 ? adParcalari[1] : ''; // 'kaya'

    Map<String, dynamic> yenisatici = {
      'adi': adi,
      'soyadi': soyadi,
      'email': _mailController.text,
      'sifre': _sifreController.text,
    };
    bool basari = await Kullanicilarvt.saticiekle(yenisatici);
    if (basari == true) {
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici = await Kullanicilarvt.getsaticiBymail(
        _mailController.text,
      );
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri =
          false;
    
      girisyapanmail = _mailController.text;
      girisyapildimi = true;
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri =
          false;
            Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).degisikliklerikaydet();
      cihazagirisbilgisinikaydet();
      context.pushReplacement(Paths.anasayfa);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S
                .of(context)
                .merhaba_kullanici(
                  Provider.of<Kullanicilarprovider>(
                    context,
                    listen: false,
                  ).currentkullanici['adi'],
                ),
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).hataliSifreVeyaMail,
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    }
    Provider.of<Loadingprovider>(context, listen: false).changemode();
  }

  Future<void> _musterikayitEkle() async {
    Provider.of<Loadingprovider>(context, listen: false).changemode();
    List<String> adParcalari = _adsoyadController.text.split(' ');
    String adi = adParcalari[0]; // 'ahmet'
    String soyadi = adParcalari.length > 1 ? adParcalari[1] : ''; // 'kaya'

    Map<String, dynamic> yenimusteri = {
      'adi': adi,
      'soyadi': soyadi,
      'email': _mailController.text,
      'sifre': _sifreController.text,
      'dogumTarihi': _dogumtarihiController.text,
    };
    bool basari = await Kullanicilarvt.musteriekle(yenimusteri);
    if (basari == true) {
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).currentkullanici = await Kullanicilarvt.getmusteriBymail(
        _mailController.text,
      );
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri =
          true;
      Provider.of<Kullanicilarprovider>(
        context,
        listen: false,
      ).degisikliklerikaydet();
      girisyapanmail = _mailController.text;
      girisyapildimi = true;
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri =
          true;
      cihazagirisbilgisinikaydet();
      context.pushReplacement(Paths.anasayfa);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S
                .of(context)
                .merhaba_kullanici(
                  Provider.of<Kullanicilarprovider>(
                    context,
                    listen: false,
                  ).currentkullanici['adi'],
                ),
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).hataliSifreVeyaMail,
            style: TextStyle(color: Renkler.kahverengi),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Renkler.krem,
        ),
      );
    }
    Provider.of<Loadingprovider>(context, listen: false).changemode();
  }

  Future<void> cihazagirisbilgisinikaydet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('girisbilgisi', girisyapildimi);
    await prefs.setBool(
      'ismusteri',
      Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri,
    );
    Cihazbellegi.ismusteri =
        Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri;
    await prefs.setString('girisyapanmail', girisyapanmail);
  }

  void dilsecimdialogu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                S.of(context).dil_ayarlari,
                style: TextStyle(
                  color: Renkler.kahverengi,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Renkler.kuyubeyaz,
              shadowColor: Renkler.kahverengi,
              iconColor: Renkler.koyuYesil,

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).turkce,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).turkce,
                    groupValue: secilendil, // ✅ Doğru kullanım
                    onChanged: (String? value) {
                      setState(() {
                        secilendil = (secilendil == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).ingilizce,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).ingilizce,
                    groupValue: secilendil,
                    onChanged: (String? value) {
                      setState(() {
                        secilendil = (secilendil == value) ? "" : value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Renkler.koyuYesil,
                    title: Text(
                      S.of(context).arapca,
                      style: TextStyle(color: Renkler.kahverengi, fontSize: 14),
                    ),
                    value: S.of(context).arapca,
                    groupValue: secilendil,
                    onChanged: (String? value) {
                      setState(() {
                        secilendil = (secilendil == value) ? "" : value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      if (secilendil == S.of(context).arapca) {
                        context.read<Dildestegiprovaider>().setarabic();
                        Navigator.pop(context);
                      } else if (secilendil == S.of(context).ingilizce) {
                        context.read<Dildestegiprovaider>().setenglish();
                        Navigator.pop(context);
                      } else if (secilendil == S.of(context).turkce) {
                        context.read<Dildestegiprovaider>().setturkish();
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      S.of(context).uygula,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _customField({
    required String hint,
    TextEditingController? controller,
    IconData? icon,
    VoidCallback? onTap,
    bool isDropdown = false,
    bool enabled = true,
    TextInputType? keyboardType,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: icon != null ? Icon(icon) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
      ),
    );
  }
}
