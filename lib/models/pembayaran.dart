// ignore_for_file: non_constant_identifier_names

import 'package:animalia_frontend/models/metode_bayar.dart';

class PembayaranModel {
  int id;
  String status;
  DateTime createdAt;
  MetodeBayarModel metodbayar;

  PembayaranModel({
    this.id,
    this.status,
    this.createdAt,
    this.metodbayar,
  });

  PembayaranModel.fromJson(Map<String, dynamic> json) {
    print('FROM JSON: $json');
    print('id bayar: ${json['id']}');
    id = json['id'].toInt();
    status = json['status'].toString();
    createdAt = DateTime.parse(json['created_at'] as String);
    metodbayar = MetodeBayarModel.fromJson(json['metodbayar']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'createdAt': createdAt,
      'metodbayar': metodbayar.toJson(),
    };
  }
}
