// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:animalia_frontend/models/metode_kirim.dart';

class PengirimanModel {
  int id;
  String status;
  DateTime tanggalKirim;
  DateTime tanggalTerima;
  String noresi;
  MetodKirimModel metodkirim;

  PengirimanModel({
    this.id,
    this.status,
    this.tanggalKirim,
    this.tanggalTerima,
    this.noresi,
    this.metodkirim,
  });

  PengirimanModel.fromJson(Map<String, dynamic> json) {
    print('FROM JSON: $json');
    print('id kirim: ${json['id']}');
    id = json['id'].toInt();
    status = json['status'].toString();
    tanggalKirim = json['tanggal_kirim'] == null
        ? null
        : DateTime.parse(json['tanggal_kirim'] as String);
    tanggalTerima = json['tanggal_terima'] == null
        ? null
        : DateTime.parse(json['tanggal_terima'] as String);
    noresi = json['noresi'].toString();
    metodkirim = MetodKirimModel.fromJson(json['metodkirim']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'tanggalKirim': tanggalKirim.toString(),
      'tanggalTerima': tanggalTerima.toString(),
      'noresi': noresi,
      'metodkirim': metodkirim.toJson(),
    };
  }
}
