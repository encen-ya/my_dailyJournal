import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/pages/simple_home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  final String title = 'MyDJ - Welcome';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String namaPengguna = '';     //digunakan untuk menyimpan username
  String sandi = '';            //digunakan untuk menyimpan sandi

  Future<void> _login(BuildContext context) async
  {
    // Ambil instance Provider (state management) kita dari BuildContext
    DataProvider provider = context.read<DataProvider>();
    // Jika username dan password benar..
    if (namaPengguna == 'guru' && sandi == 'guru')
    {
      // Simpan info login lewat Provider (State Management)
      await provider.saveLoginInfo(namaPengguna, sandi);
      // Jika ingin menggunakan BuildContext dalam operasi async, harus dicek dulu
      if(context.mounted)
      {
        // Buka halaman home
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SimpleHomePage(title: 'Beranda'),
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding:EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/login_icon.png', width: 250),
                SizedBox(height: 10),
                Text('Nama Pengguna:'),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                onChanged: (value) => {setState(() {
                  namaPengguna = value;
                }
                )},
                ),
                SizedBox(height: 10),
                Text('Sandi'),
                SizedBox(height: 10),
                PasswordField(
                  onChanged: (value) => sandi = value,
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: () => {_login(context)}, child: Text('Login'))
              ], 
            ),
          ),
        ), 
        ),
    );
  }
}