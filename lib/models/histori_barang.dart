// ignore_for_file: non_constant_identifier_names

import 'package:animalia_frontend/models/detail_transaksi_barang.dart';
import 'package:animalia_frontend/models/pembayaran.dart';
import 'package:animalia_frontend/models/pengiriman.dart';
import 'package:animalia_frontend/models/user_model.dart';

class HistoryBarangModel {
  int id;
  String alamat;
  double total_harga;
  String status;
  String user_id;
  DateTime tanggal_pembelian;
  // DetailTransaksiBarangModel detailbarang;
  List<DetailTransaksiBarangModel> detailbarang;
  // PembayaranModel pembayaran;
  // PengirimanModel pengiriman;

  HistoryBarangModel({
    this.id,
    this.alamat,
    this.total_harga,
    this.status,
    this.user_id,
    this.tanggal_pembelian,
    this.detailbarang,
    // this.pembayaran,
    // this.pengiriman,
  });

  HistoryBarangModel.fromJson(Map<String, dynamic> json) {
    // print('FROM JSON: $json');
    // print('id: ${json['id']}');
    // print('id: ${json['pembayaran']}');
    id = json['id'];
    alamat = json['alamat'].toString();
    status = json['status'].toString();
    user_id = json['email'].toString();
    tanggal_pembelian = DateTime.parse(json['tanggal_pembelian'] as String);
    total_harga = double.parse(json['total_harga'].toString());
    detailbarang = json['detailbarang']
        .map<DetailTransaksiBarangModel>(
            (detailbarang) => DetailTransaksiBarangModel.fromJson(detailbarang))
        .toList();
    // pembayaran = PembayaranModel.fromJson(json['pembayaran']);
    // pengiriman = PengirimanModel.fromJson(json['pengiriman']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alamat': alamat,
      'status': status,
      'user_id': user_id,
      'total_harga': total_harga,
      'tanggal_pembelian': tanggal_pembelian,
      // 'detailbarang': detailbarang.toJson(),
      'detailbarang':
          detailbarang.map((detailbarang) => detailbarang.toJson()).toList(),
      // 'pembayaran': pembayaran.toJson(),
      // 'pengiriman': pengiriman.toJson(),
    };
  }
}
