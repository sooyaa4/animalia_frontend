// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:animalia_frontend/models/product_barang_model.dart';

class DetailTransaksiTreatmentModel {
  int id;
  int jumlah_pesan_jasa;
  DateTime tanggal_booking;

  DetailTransaksiTreatmentModel({
    this.id,
    this.jumlah_pesan_jasa,
    this.tanggal_booking,
  });

  DetailTransaksiTreatmentModel.fromJson(Map<String, dynamic> json) {
    print('FROM JSON: $json');
    print('id detail: $id');
    id = json['id'].toInt();
    jumlah_pesan_jasa = json['jumlah_pesan_jasa'].toInt();
    tanggal_booking = DateTime.parse(json['tanggal_booking'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jumlah_pesan': jumlah_pesan_jasa,
      'tanggal_booking': tanggal_booking,
    };
  }
}
