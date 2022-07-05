// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:animalia_frontend/models/category_model.dart';

class ProductBarangModel {
  int id;
  String nama_barang;
  String merk_barang;
  String deskripsi_barang;
  String berat;
  double harga;
  int stok;
  CategoryModel katbarang;
  DateTime createdAt;
  DateTime updateAt;
  DateTime deleteAt;

  ProductBarangModel({
    this.id,
    this.nama_barang,
    this.merk_barang,
    this.deskripsi_barang,
    this.berat,
    this.harga,
    this.stok,
    this.katbarang,
    this.createdAt,
    this.updateAt,
    this.deleteAt,
  });

  ProductBarangModel.fromJson(Map<String, dynamic> json) {
    // print('FROM JSON: $json');
    // print('id: ${json['id']}');
    // print('nama: ${json['nama_barang']}');
    // print('desk: ${json['deskripsi_barang']}');
    // print('harga: ${json['harga']}');

    id = json['id'];
    nama_barang = json['nama_barang'];
    merk_barang = json['merk_barang'];
    berat = json['berat'];
    harga = json['harga'].toDouble();
    stok = json['stok'];
    deskripsi_barang = json['deskripsi_barang'];
    katbarang = CategoryModel.fromJson(json['katbarang']);
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
    deleteAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_barang': nama_barang,
      'merk_barang': merk_barang,
      'berat': berat,
      'harga': harga,
      'stok ': stok,
      'category': katbarang.toJson(),
      'createdAt': createdAt.toString(),
      'updateAt': updateAt.toString(),
      'deleteAt': deleteAt.toString(),
    };
  }
}
