import 'package:flutter/material.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key, required this.title, });
  final String title;

  @override
  State<LihatJurnalPage> createState() => _LihatJurnalPageState();
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            Expanded(//supaya widget otomatis melebar, menuhin ruang kosong
              child: ListView.separated(//seperated maksud nya supaya tiap listView otomatis ada garis pemisah
                itemBuilder: (context, index) => ListTile(//listTile buat menyediakan slot khusus tiap list(kayak WA)
                  //leading | bisa di kasih foto profil, atau icon. mirip WA letak di kiri
                  title: Text('Judul indeks ke-$index'),
                  subtitle: Text('Sub-judul indek ke-$index'),
                  trailing: Text('Trailing indek ke-$index'),
                  onTap: () => {},
                ), separatorBuilder: (context,index) => const Divider(),
                itemCount: 20,
              ), 
            ),
          ],
        ),
      ),
    );
  }
}