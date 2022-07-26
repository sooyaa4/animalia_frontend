// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:animalia_frontend/models/user_model.dart';

class TreatmentModel {
  int id;
  String nama_jasa;
  double harga;
  String deskripsi;
  DateTime createdAt;
  DateTime updateAt;
  DateTime deleteAt;

  TreatmentModel({
    this.id,
    this.nama_jasa,
    this.deskripsi,
    this.harga,
    this.createdAt,
    this.updateAt,
    this.deleteAt,
  });

  TreatmentModel.fromJson(Map<String, dynamic> json) {
    // print('FROM JSON: $json');
    // print('id: ${json['id']}');
    // print('nama: ${json['nama_jasa']}');
    // print('desk: ${json['deskripsi']}');
    // print('harga: ${json['harga']}');

    id = json['id'];
    nama_jasa = json['nama_jasa'];
    deskripsi = json['deskripsi'];
    harga = json['harga'].toDouble();
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
    deleteAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String);
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'nama_jasa': nama_jasa,
      'deskripsi': deskripsi,
      'harga': harga,
      'createdAt': createdAt.toString(),
      'updateAt': updateAt.toString(),
      'deleteAt': deleteAt.toString(),
    };
  }
}
