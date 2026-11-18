import 'package:flutter/material.dart';
import 'package:mydj/pages/buat_jurnal_page.dart';
import 'package:mydj/pages/lihat_jurnal_page.dart';
import 'package:mydj/pages/akun_page.dart';
class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SimpleHomePageState();
  }
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.white,
        title: Center(child: Text(widget.title)),
        centerTitle: true,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Image.asset(
                  'assets/images/kemendikbud.png',
                  width: 150,
                  height: 200,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(onPressed: () => {_openLihatJurnalPage(context)}, child: Text('Lihat Jurnal')),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: () {_openBuatJurnalPage(context);}, child: Text('Buat Jurnal')),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {_openAkunJurnal(context);}, child: Text('Akun')),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: () {}, child: Text('Tentang Aplikasi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _openLihatJurnalPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LihatJurnalPage(title: 'Lihat Jurnal')
      ),
    );  
  }
  void _openBuatJurnalPage(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => BuatJurnalPage())
      );
  }
  void _openAkunJurnal(BuildContext context){
    Navigator.push(
    context ,
    MaterialPageRoute(builder: (context) => AkunPageState()));
  }
}
