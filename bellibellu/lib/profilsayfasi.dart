import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/loginsayfasi.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/kullanicilarVT.dart';
import 'package:bellibellu/services/kullanicilarprovider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grock/grock.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({super.key});

  @override
  State<ProfilSayfasi> createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  final TextEditingController _adsoyadcontroller = TextEditingController();
  final TextEditingController _adresController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController currentController = TextEditingController();
  final TextEditingController newController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (Provider.of<Kullanicilarprovider>(context, listen: false).ismusteri) {
      _adresController.text =
          Provider.of<Kullanicilarprovider>(
            context,
            listen: false,
          ).currentkullanici['adres'] ??
          '';
      _dateController.text = DateFormat('dd.MM.yyyy').format(
        DateTime.parse(
          Provider.of<Kullanicilarprovider>(
            context,
            listen: false,
          ).currentkullanici['dogumTarihi'],
        ),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(
        Provider.of<Kullanicilarprovider>(
          context,
          listen: false,
        ).currentkullanici['dogumTarihi'],
      ),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null &&
        picked !=
            Provider.of<Kullanicilarprovider>(
              context,
              listen: false,
            ).currentkullanici['dogumTarihi']) {
      setState(() {
        Provider.of<Kullanicilarprovider>(
              context,
              listen: false,
            ).currentkullanici['dogumTarihi'] =
            picked;
        _dateController.text = DateFormat('dd.MM.yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: Renkler.kuyubeyaz,
      appBar: AppBar(
        surfaceTintColor: Renkler.kahverengi,
        backgroundColor: Renkler.kahverengi,
        title: const Text(
          "Profil Bilgileri",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Renkler.kahverengi, // Gri çizgi rengi
          ),

          const SizedBox(height: 50),

          // Fotoğraf ve isim
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  // Büyük profil dairesi
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ), // açık gri arka plan
                    child: Image.asset(
                      'assets/profilimage.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Küçük kamera dairesi
                  GestureDetector(
                    onTap: () {
                      showBelgeSecimPopupDialog(context);
                    },
                    child: Positioned(
                      bottom: 0,
                      right: 4,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Renkler.kahverengi,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          'assets/kamera.png',
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                context.watch<Kullanicilarprovider>().currentkullanici['adi'] +
                    ' ' +
                    context
                        .watch<Kullanicilarprovider>()
                        .currentkullanici['soyadi'],
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),

          const SizedBox(height: 30),
          const Divider(
            height: 32,
            thickness: 1,
            color: Renkler.kahverengi, // Gri çizgi rengi
          ),
          const SizedBox(height: 20),
          // İsim alanı
          TextField(
            controller: _adsoyadcontroller,
            cursorColor: Renkler.kahverengi,
            decoration: InputDecoration(
              labelText: "Adınız ve Soyadınız",
              hintText:
                  context
                      .watch<Kullanicilarprovider>()
                      .currentkullanici['adi'] +
                  ' ' +
                  context
                      .watch<Kullanicilarprovider>()
                      .currentkullanici['soyadi'],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              floatingLabelStyle: TextStyle(color: Renkler.kahverengi),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Renkler.kahverengi, width: 2.0),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Kaydet butonu
          const SizedBox(height: 32),

          // Bilgi kartları
          _infoTile(
            context,
            S.of(context).email,
            Provider.of<Kullanicilarprovider>(
              context,
              listen: false,
            ).currentkullanici['email'],
            _emailPopup,
          ),
          _infoTile(
            context,
            S.of(context).sifreb,
            '${Provider.of<Kullanicilarprovider>(context, listen: false).currentkullanici['sifre'].substring(0, 2)}********',
            _sifrePopup,
          ),
          (context.watch<Kullanicilarprovider>().ismusteri == false)
              ? _infoTile(
                context,
                S.of(context).telefon,
                Provider.of<Kullanicilarprovider>(
                          context,
                          listen: false,
                        ).currentkullanici['telefonNo'] !=
                        null
                    ? "**********${Provider.of<Kullanicilarprovider>(context, listen: false).currentkullanici['telefonNo'].substring('telefon'.length - 2)}"
                    : ' ',
                _telefonPopup,
              )
              : Column(
                children: [
                  _infoTile(
                    context,
                    S.of(context).dogum_tarihi,
                    "${Provider.of<Kullanicilarprovider>(context, listen: false).currentkullanici['dogumTarihi'].toString().substring(0, 10)}",
                    _dogumtarihiPopup,
                  ),
                  _infoTile(
                    context,
                    S.of(context).adres.substring(0, 5),
                    ((Provider.of<Kullanicilarprovider>(
                                      context,
                                      listen: false,
                                    ).currentkullanici['adres'] ??
                                    '')
                                .toString()
                                .length >
                            15)
                        ? "${(Provider.of<Kullanicilarprovider>(context, listen: false).currentkullanici['adres'] ?? "").toString().substring(0, 15)}....."
                        : Provider.of<Kullanicilarprovider>(
                          context,
                          listen: false,
                        ).currentkullanici['adres'].toString(),
                    _adresPopup,
                  ),
                ],
              ),
          SizedBox(height: 50),
          SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (!Provider.of<Kullanicilarprovider>(
                  context,
                  listen: false,
                ).ismusteri) {
                  Kullanicilarvt.updateSaticiBilgileri(
                    Provider.of<Kullanicilarprovider>(
                      context,
                      listen: false,
                    ).currentkullanici,
                  );
                }
                Kullanicilarvt.updateMusteriBilgileri(
                  Provider.of<Kullanicilarprovider>(
                    context,
                    listen: false,
                  ).currentkullanici,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Renkler.kahverengi,
              ),
              child: const Text(
                "Kaydet",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setBool('girisbilgisi', false);
                await prefs.setString('girisyapanmail', '');
                context.go(Paths.loginsayfasi);
              },
              icon: const Icon(Icons.logout),
              label: const Text("Çıkış Yap"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 162, 34, 25),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),

          SizedBox(height: 150),
        ],
      ),
    );
  }

  Widget _infoTile(
    BuildContext context,
    String title,
    String maskedValue,
    Function modalFunc,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Text(
                maskedValue,
                style: const TextStyle(color: Renkler.kahverengi),
              ),
            ],
          ),
          InkWell(
            onTap: () => modalFunc(context),
            child: Text(
              S.of(context).duzenle,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Renkler.kahverengi,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Telefon Popup
  void _telefonPopup(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Renkler.kahverengi,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Telefon Numarası",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _telefonController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Telefon Numarası",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi, // Buton rengi
                  ),
                  onPressed: () async {
                    Provider.of<Kullanicilarprovider>(
                          context,
                          listen: false,
                        ).currentkullanici['telefon'] =
                        _telefonController.text;
                    context.pop();
                  },
                  child: const Text(
                    "Değiştir",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }

  void _dogumtarihiPopup(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Renkler.kahverengi,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                S.of(context).dogum_tarihi,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Icon(Icons.calendar_month_outlined),
                  ),
                  labelText: S.of(context).dogum_tarihi,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi, // Buton rengi
                  ),
                  onPressed: () async {
                    Provider.of<Kullanicilarprovider>(
                          context,
                          listen: false,
                        ).currentkullanici['dogumTarihi'] =
                        _dateController.text;
                    context.pop();
                  },
                  child: const Text(
                    "Değiştir",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }

  void _adresPopup(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Renkler.kahverengi,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                S.of(context).adres,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                maxLines: 5,
                controller: _adresController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: S.of(context).adres,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi, // Buton rengi
                  ),
                  onPressed: () async {
                    Provider.of<Kullanicilarprovider>(
                          context,
                          listen: false,
                        ).currentkullanici['adres'] =
                        _adresController.text;
                    context.pop();
                  },
                  child: const Text(
                    "Değiştir",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }

  // E-Mail Popup
  void _emailPopup(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Renkler.kahverengi,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "E-Mail",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-Mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi, // Buton rengi
                  ),
                  onPressed: () {
                    Provider.of<Kullanicilarprovider>(
                          context,
                          listen: false,
                        ).currentkullanici['email'] =
                        _emailcontroller.text;
                    context.pop();
                  },
                  child: const Text(
                    "Değiştir",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }

  // Şifre Popup
  void _sifrePopup(BuildContext context) {
    bool isCurrentVisible = false;
    bool isNewVisible = false;

    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                top: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Renkler.kahverengi,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Şifre",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: currentController,
                    obscureText: !isCurrentVisible,
                    decoration: InputDecoration(
                      labelText: "Mevcut Şifreniz",
                      suffixIcon: IconButton(
                        icon: Icon(
                          isCurrentVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            () => setModalState(
                              () => isCurrentVisible = !isCurrentVisible,
                            ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: newController,
                    obscureText: !isNewVisible,
                    decoration: InputDecoration(
                      labelText: "Yeni Şifreniz",
                      suffixIcon: IconButton(
                        icon: Icon(
                          isNewVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed:
                            () => setModalState(
                              () => isNewVisible = !isNewVisible,
                            ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Renkler.kahverengi, // Buton rengi
                      ),
                      onPressed: () {
                        if (currentController.text ==
                            Provider.of<Kullanicilarprovider>(
                              context,
                              listen: false,
                            ).currentkullanici['sifre']) {
                          Provider.of<Kullanicilarprovider>(
                                context,
                                listen: false,
                              ).currentkullanici['sifre'] =
                              newController.text;
                          currentController.text = '';
                          newController.text = '';
                          context.pop();
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
                      },
                      child: const Text(
                        "Değiştir",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showBelgeSecimPopupDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Fiş / Fatura",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const Divider(thickness: 1, color: Color(0xFFE0E3E7)),
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.orange,
                  ),
                  title: const Text("Fotoğraf Çek"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.download_outlined,
                    color: Colors.blue,
                  ),
                  title: const Text("Galeriden Yükle"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickFromGallery();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickFromGallery() async {
    await Permission.photos.request();
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // işle veya başka sayfaya gönder
      debugPrint("Galeriden seçilen: ${image.path}");
    }
  }
}
