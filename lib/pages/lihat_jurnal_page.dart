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
  void initState()
  {
    super.initState();
    // Muat jurnal dari SQLite sekali saja saat halaman dibuka
    context.read<DataProvider>().muatJurnal();
  }

  @override
  Widget build(BuildContext context) {
    final List<Jurnal> daftarJurnal = context.watch<DataProvider>().jurnalTersimpan;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title),
        centerTitle: true,
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
                  subtitle: Text(
                    '${daftarJurnal[index].mapel}\n${daftarJurnal[index].createdAt}',
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<DataProvider>().hapusJurnal(daftarJurnal[index].id!);
                    },
                  ),
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