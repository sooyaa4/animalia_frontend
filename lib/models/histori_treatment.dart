// ignore_for_file: non_constant_identifier_names

import 'package:animalia_frontend/models/pembayaran.dart';

class HistoriTreatmentModel {
  int id;
  String alamat;
  double total_harga;
  double subtotal;
  String status;
  String user_id;
  DateTime tanggal_pembelian;
  List<PembayaranModel> pembayaran;

  HistoriTreatmentModel({
    this.id,
    this.alamat,
    this.total_harga,
    this.subtotal,
    this.status,
    this.user_id,
    this.tanggal_pembelian,
    this.pembayaran,
  });

  HistoriTreatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alamat = json['alamat'].toString();
    status = json['status'].toString();
    user_id = json['email'].toString();
    tanggal_pembelian = DateTime.parse(json['tanggal_pembelian'] as String);
    total_harga = double.parse(json['total_harga'].toString());
    subtotal = double.parse(json['subtotal'].toString());
    pembayaran = json['pembayaran']
        .map<PembayaranModel>(
            (pembayaran) => PembayaranModel.fromJson(pembayaran))
        .toList();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alamat': alamat,
      'status': status,
      'user_id': user_id,
      'total_harga': total_harga,
      'tanggal_pembelian': tanggal_pembelian,
      'pembayaran':
          pembayaran.map((pembayaran) => pembayaran.toJson()).toList(),
    };
  }
}
