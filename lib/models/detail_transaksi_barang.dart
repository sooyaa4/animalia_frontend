// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:animalia_frontend/models/product_barang_model.dart';

class DetailTransaksiBarangModel {
  int id;
  int jumlah_pesan;
  List<ProductBarangModel> produk;
  //ProductBarangModel produk;
  DetailTransaksiBarangModel({
    this.id,
    this.jumlah_pesan,
    this.produk,
  });

  DetailTransaksiBarangModel.fromJson(Map<String, dynamic> json) {
    print('FROM JSON: $json');
    print('id detail: $id');
    id = json['id'].toInt();
    jumlah_pesan = json['jumlah_pesan'].toInt();
    produk = json['produk']
        .map<ProductBarangModel>(
            (produk) => ProductBarangModel.fromJson(produk))
        .toList();
    // produk = ProductBarangModel.fromJson(json['produk']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'jumlah_pesan': jumlah_pesan,
      'produk': produk.map((produk) => produk.toJson()).toList(),
      // 'produk': produk.toJson(),
    };
  }
}
