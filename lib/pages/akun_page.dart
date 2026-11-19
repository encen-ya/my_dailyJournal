import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/data/login_info.dart';
import 'package:mydj/pages/login_page.dart';

class AkunPage extends StatefulWidget {
  final String title = 'Akun';
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ganti Sandi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2),
              SizedBox(height: 10),
              Text('Sandi Saat Ini'),
              SizedBox(height: 10),
              PasswordField(),
              SizedBox(height: 10),
              Text('Sandi Baru'),
              SizedBox(height: 10),
              PasswordField(),
              SizedBox(height: 10),
              Text('Konfirmasi Sandi Baru'),
              SizedBox(height: 10),
              PasswordField(),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: Text('Simpan'),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Keluar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: Text('Keluar dari Aplikasi'),
                  onPressed: () {
                    _logout(context); // <-- Nanti kita buat method _logout ini
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openLoginPage(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async
  {
    await LoginInfo.deleteFromSharedPreferences();
    // Operasi async bisa memakan waktu, pastikan widget masih ada sebelum pakai context.
    if (!context.mounted) return;
    _openLoginPage(context);
  }
}
