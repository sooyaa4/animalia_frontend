// ignore_for_file: non_constant_identifier_names

import 'package:animalia_frontend/models/product_barang_model.dart';

class CartModel {
  int id;
  ProductBarangModel product;
  int jumlah_pesan;

  CartModel({
    this.id,
    this.product,
    this.jumlah_pesan,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductBarangModel.fromJson(json['product']);
    jumlah_pesan = json['jumlah_pesan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'jumlah_pesam': jumlah_pesan,
    };
  }

  double getTotalPrice() {
    return product.harga * jumlah_pesan;
  }
}
