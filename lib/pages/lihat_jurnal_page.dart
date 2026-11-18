import 'package:flutter/material.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/data/jurnal.dart';
import 'package:provider/provider.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key, required this.title, });
  final String title;

  @override
  State<LihatJurnalPage> createState() => _LihatJurnalPageState();
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    final List<Jurnal> daftarJurnal = context.watch<DataProvider>().jurnalTersimpan;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Expanded(                                             //supaya widget otomatis melebar, menuhin ruang kosong
              child: ListView.separated(                          //seperated maksud nya supaya tiap listView otomatis ada garis pemisah
                itemBuilder: (context, index) => ListTile(        //listTile buat menyediakan slot khusus tiap list(kayak WA)
                  //leading | bisa di kasih foto profil, atau icon. mirip WA letak di kiri
                  title: Text(daftarJurnal[index].kelas),
                  subtitle: Text(daftarJurnal[index].mapel),
                  trailing: Text(daftarJurnal[index].createdAt.toString()),
                  onTap: () {},
                ), separatorBuilder: (context,index) => const Divider(),
                itemCount: daftarJurnal.length,
              ), 
            ),
          ],
        ),
      ),
    );
  }
}