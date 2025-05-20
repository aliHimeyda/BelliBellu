import 'package:bellibellu/generated/l10n.dart';
import 'package:bellibellu/renkler.dart';
import 'package:bellibellu/router.dart';
import 'package:bellibellu/services/loadingprovider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SaticiMesajlarimPage extends StatefulWidget {
  @override
  _SaticiMesajlarimPageState createState() => _SaticiMesajlarimPageState();
}

class _SaticiMesajlarimPageState extends State<SaticiMesajlarimPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool sohbetVar = true; // false yaparsan boş ekran gelir

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Scaffold(
          backgroundColor: Renkler.kuyubeyaz,
          appBar: AppBar(
            title: Text(
              S.of(context).satici_mesajlarim,
              style: TextStyle(
                color: Renkler.kahverengi,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Renkler.krem,
            iconTheme: IconThemeData(color: Colors.black),
            bottom: TabBar(
              dividerColor: Renkler.kahverengi,
              indicatorColor: Renkler.kahverengi,
              controller: _tabController,
              labelColor: Renkler.kahverengi,
              unselectedLabelColor: Renkler.kahverengi,
              tabs: [
                Tab(text: S.of(context).urun_sorularim),
                Tab(text: S.of(context).siparis_sorularim),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              sohbetVar ? buildSohbetListesi() : buildBosEkran(),
              sohbetVar ? buildSohbetListesi() : buildBosEkran(),
            ],
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

  Widget buildBosEkran() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail_outline, size: 64, color: Renkler.kahverengi),
          SizedBox(height: 16),
          Text(S.of(context).urun_soru_yok, style: TextStyle(fontSize: 16)),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              S.of(context).alisverise_devam_et,
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Renkler.kahverengi,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSohbetListesi() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        buildSohbetKart(
          satici: "VPBİLİŞİM",
          tarih: "22 Eylül 2023",
          teslimatNo: "2873611290",
          mesaj: "Birazdan kargoya verilecek",
        ),
        buildSohbetKart(
          satici: "TEKNOEXPRESS",
          tarih: "12 Eylül 2023",
          teslimatNo: "2866714532",
          mesaj: "Ürün yarın stoklara giriyor.",
        ),
      ],
    );
  }

  Widget buildSohbetKart({
    required String satici,
    required String tarih,
    required String teslimatNo,
    required String mesaj,
  }) {
    return Card(
      color: Renkler.krem,
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.store, color: Renkler.kahverengi),
        title: Text(satici, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${S.of(context).teslimat_no}: $teslimatNo"),
            Text("${S.of(context).satici}: $mesaj"),
          ],
        ),
        trailing: Text(tarih, style: TextStyle(fontSize: 12)),
        onTap: () {
          context.push(Paths.sohbeticerigisayfasi);
        },
      ),
    );
  }
}
