import 'package:mydj/main.dart';
import 'package:mydj/pages/lihat_jurnal_page.dart';

class Jurnal {
  final DateTime _createdAt;//untuk menyimpan jam simpan
  String kelas;
  String mapel;
  int jam;
  String tujuanPembelajaran;
  String materiTopikPemebelajaran;
  String kegiatanPemebelajaran;
  String dimensiProfilPelajarPancasila;

  Jurnal({
    this.kelas = '',
    this.mapel = '',
    this.jam = 0,
    this.tujuanPembelajaran = '',
    this.materiTopikPemebelajaran = '',
    this.kegiatanPemebelajaran = '',
    this.dimensiProfilPelajarPancasila = '',
  }): _createdAt = DateTime.now();//ngasih nilai ke createdAt sebelum konstruktor dijalankan

  DateTime get createdAt => _createdAt;
}