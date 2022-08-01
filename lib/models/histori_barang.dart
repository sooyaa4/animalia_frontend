// ignore_for_file: non_constant_identifier_names

import 'package:animalia_frontend/models/detail_transaksi_barang.dart';
import 'package:animalia_frontend/models/pembayaran.dart';
import 'package:animalia_frontend/models/pengiriman.dart';
import 'package:animalia_frontend/models/user_model.dart';

class HistoryBarangModel {
  int id;
  String alamat;
  double total_harga;
  double subtotal;
  String status;
  String user_id;
  DateTime tanggal_pembelian;
  // List<DetailTransaksiBarangModel> detailbarang;
  List<PembayaranModel> pembayaran;
  List<PengirimanModel> pengiriman;

  HistoryBarangModel({
    this.id,
    this.alamat,
    this.total_harga,
    this.subtotal,
    this.status,
    this.user_id,
    this.tanggal_pembelian,
    // this.detailbarang,
    this.pembayaran,
    this.pengiriman,
  });

  HistoryBarangModel.fromJson(Map<String, dynamic> json) {
    print('FROM JSON: $json');
    print('id: ${json['id']}');
    id = json['id'].toInt();
    alamat = json['alamat'].toString();
    status = json['status'].toString();
    user_id = json['email'].toString();
    tanggal_pembelian = DateTime.parse(json['tanggal_pembelian'] as String);
    total_harga = double.parse(json['total_harga'].toString());
    subtotal = double.parse(json['subtotal'].toString());

    // detailbarang = json['detailbarang']
    //     .map<DetailTransaksiBarangModel>(
    //         (detailbarang) => DetailTransaksiBarangModel.fromJson(detailbarang))
    //     .toList();

    pembayaran = json['pembayaran']
        .map<PembayaranModel>(
            (pembayaran) => PembayaranModel.fromJson(pembayaran))
        .toList();

    pengiriman = json['pengiriman']
        .map<PengirimanModel>(
            (pengiriman) => PengirimanModel.fromJson(pengiriman))
        .toList();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alamat': alamat,
      'status': status,
      'user_id': user_id,
      'total_harga': total_harga,
      'subtotal': subtotal,
      'tanggal_pembelian': tanggal_pembelian,
      // 'detailbarang':
      //     detailbarang.map((detailbarang) => detailbarang.toJson()).toList(),
      'pembayaran':
          pembayaran.map((pembayaran) => pembayaran.toJson()).toList(),
      'pengiriman':
          pengiriman.map((pengiriman) => pengiriman.toJson()).toList(),
    };
  }
}
