import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SepetSayfasi extends StatefulWidget {
  const SepetSayfasi({super.key});

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  final Map<String, List<Map<String, dynamic>>> sepet = {
    'Altınyıldız Classics': [
      {
        'isim': 'Yeşil T-Shirt',
        'adet': 1,
        'fiyat': 234.89,
        'secili': false,
        'resimyolu':
            'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/resim2.png',
      },
      {
        'isim': 'Lacivert T-Shirt',
        'adet': 1,
        'fiyat': 255.77,
        'secili': false,
        'resimyolu':
            'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/resim3.png',
      },
    ],
    'Efsun': [
      {
        'isim': 'Beyaz Gömlek',
        'adet': 1,
        'fiyat': 199.99,
        'secili': false,
        'resimyolu':
            'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/resim5.png',
      },
      {
        'isim': 'Siyah Pantolon',
        'adet': 1,
        'fiyat': 299.99,
        'secili': false,
        'resimyolu':
            'https://raw.githubusercontent.com/aliHimeyda/BelliBellu/main/bellibellu/lib/images/resim9.png',
      },
    ],
  };

  double get toplamFiyat {
    double toplam = 0.0;
    sepet.forEach((satici, urunler) {
      for (var urun in urunler) {
        if (urun['secili'] == true) {
          toplam += urun['fiyat'] * urun['adet'];
        }
      }
    });
    return toplam;
  }

  void toggleSatici(String satici, bool? value) {
    setState(() {
      for (var urun in sepet[satici]!) {
        urun['secili'] = value;
      }
    });
  }

  bool tumUrunlerSecili(String satici) {
    return sepet[satici]!.every((urun) => urun['secili'] == true);
  }

  void toggleUrun(String satici, int index, bool? value) {
    setState(() {
      sepet[satici]![index]['secili'] = value;
    });
  }

  void detayGoster() {
    showModalBottomSheet(
      backgroundColor: Renkler.kuyubeyaz,
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).sepet_detayi,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Renkler.kahverengi,
                ),
              ),
              const SizedBox(height: 12),
              ...sepet.entries.expand(
                (entry) => entry.value.where((urun) => urun['secili']).map((
                  urun,
                ) {
                  return ListTile(
                    leading: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey[300],
                        ),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Renkler.kahverengi,
                          child: Text(
                            "x${urun['adet']}",
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text(urun['isim']),
                    trailing: Text("${urun['fiyat'].toStringAsFixed(2)} TL"),
                  );
                }),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).toplam,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Renkler.kahverengi,
                    ),
                  ),
                  Text(
                    "${toplamFiyat.toStringAsFixed(2)} TL",
                    style: TextStyle(color: Renkler.kahverengi),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Renkler.kahverengi,
            title: Text(
              S.of(context).sepetim_baslik('10'),
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: ListView(
            children: [
              ...sepet.entries.map((entry) {
                String satici = entry.key;
                List<Map<String, dynamic>> urunler = entry.value;
                return Card(
                  color: const Color.fromARGB(255, 250, 241, 226),
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CheckboxListTile(
                        value: tumUrunlerSecili(satici),
                        activeColor: Renkler.kahverengi,
                        onChanged: (val) => toggleSatici(satici, val),
                        title: Text(
                          satici,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ...urunler.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, dynamic> urun = entry.value;
                        return Column(
                          children: [
                            Divider(color: Renkler.kahverengi),
                            Container(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              margin: const EdgeInsets.symmetric(vertical: 6),
        
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Checkbox
                                  Checkbox(
                                    activeColor: Renkler.kahverengi,
                                    value: urun['secili'],
                                    onChanged:
                                        (val) => toggleUrun(satici, index, val),
                                  ),
        
                                  // Görsel
                                  Container(
                                    width: 120,
                                    height: 120,
                                    child: Image.network(
                                      urun['resimyolu'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
        
                                  const SizedBox(width: 15),
        
                                  // Ürün bilgileri + adet sayacı
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          urun['isim'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
        
                                        // Adet sayacı
                                        Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Renkler.kahverengi.withOpacity(
                                                0.4,
                                              ),
                                            ),
                                            borderRadius: BorderRadius.circular(24),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.remove,
                                                  size: 16,
                                                  color: Renkler.kahverengi,
                                                ),
                                                onPressed: () {},
                                                // onPressed: urun['adet'] > 1 ? onAzalt : null,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Renkler.kahverengi
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Text(
                                                  urun['adet'].toString(),
                                                  style: const TextStyle(
                                                    color: Renkler.kahverengi,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 16,
                                                  color: Renkler.kahverengi,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ],
                                          ),
                                        ),
        
                                        const SizedBox(height: 4),
                                        Text("Fiyat: ${urun['fiyat']} TL"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                );
              }),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Renkler.krem,
            child: Row(
              children: [
                GestureDetector(
                  onTap: detayGoster,
                  child: Row(
                    children: [
                      Text(
                        S.of(context).toplam,
                        style: TextStyle(
                          color: Renkler.kahverengi,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_up,
                        color: Renkler.kahverengi,
                      ),
                      Text(
                        " ${toplamFiyat.toStringAsFixed(2)} TL",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Renkler.kahverengi,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Renkler.kahverengi,
                  ),
                  child: Text(
                    S.of(context).sepeti_onayla,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
         Provider.of<Loadingprovider>(context,listen: false).isloading?
        Center(
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
        ):SizedBox()
      ],
    );
  }
}
