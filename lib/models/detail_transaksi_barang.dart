// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:animalia_frontend/models/product_barang_model.dart';

class DetailTransaksiBarangModel {
  int id;
  int jumlah_pesan;
  double subtotal;
  // List<ProductBarangModel> produk;
  DetailTransaksiBarangModel({
    this.id,
    this.jumlah_pesan,
    this.subtotal,
    // this.produk,
  });

  DetailTransaksiBarangModel.fromJson(Map<String, dynamic> json) {
    print('FROM JSON: $json');
    print('id detail: $id');
    id = json['id'].toInt();
    jumlah_pesan = json['jumlah_pesan'].toInt();
    subtotal = double.parse(json['subtotal'].toString());
    // produk = json['produk']
    //     .map<ProductBarangModel>(
    //         (produk) => ProductBarangModel.fromJson(produk))
    //     .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jumlah_pesan': jumlah_pesan,
      'subtotal': subtotal,
      // 'produk': produk.map((produk) => produk.toJson()).toList(),
    };
  }
}
