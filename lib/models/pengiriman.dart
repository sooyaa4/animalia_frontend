// ignore_for_file: non_constant_identifier_names

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
    id = json['id'];
    status = json['status'];
    tanggalKirim = json['tanggalKirim'];
    tanggalTerima = json['tanggalTerima'];
    noresi = json['noresi'];
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
