// ignore_for_file: non_constant_identifier_names

class HistoriTreatmentModel {
  int id;
  int jumlah_pesan_jasa;
  double subtotal;
  DateTime tanggal_booking;

  HistoriTreatmentModel({
    this.id,
    this.jumlah_pesan_jasa,
    this.subtotal,
    this.tanggal_booking,
  });

  HistoriTreatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jumlah_pesan_jasa = json['jumlah_pesan_jasa'];
    subtotal = json['subtotal'].toDouble;
    
  }
}
