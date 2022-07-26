// ignore_for_file: non_constant_identifier_names

import 'package:animalia_frontend/models/treatment_model.dart';

class CartTreatmentModel {
  int id;
  TreatmentModel treatment;
  int jumlah_pesan_jasa;

  CartTreatmentModel({
    this.id,
    this.treatment,
    this.jumlah_pesan_jasa,
  });

  CartTreatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    treatment = TreatmentModel.fromJson(json['treatment']);
    jumlah_pesan_jasa = json['jumlah_pesan_jasa'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'treatment': treatment.tojson(),
      'jumlah_pesan_jasa': jumlah_pesan_jasa,
    };
  }

  double getTotalPrice() {
    return treatment.harga * jumlah_pesan_jasa;
  }
}
