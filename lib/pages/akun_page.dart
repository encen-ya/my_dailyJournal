import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';

class AkunPageState extends StatefulWidget {
  final String title = 'Akun';
  const AkunPageState({super.key});

  @override
  State<AkunPageState> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPageState> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Akun'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: Padding(
      padding: EdgeInsetsGeometry.all(20),
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
          Text('Ganti Sandi'),
          SizedBox(height: 10),
          PasswordField(),
          SizedBox(height: 10),
          Text('Konfimasi Sandi Baru'),
          SizedBox(height: 10),
          PasswordField(),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => {}, child: Text('Simpan'))),
          SizedBox(height: 10),
          Text(
            'Keluar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(thickness: 2),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => {}, child: Text('Keluar dari Aplikasi'))),
        ],
      ),
      ),
  );
}
}