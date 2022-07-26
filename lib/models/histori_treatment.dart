// ignore_for_file: non_constant_identifier_names

class HistoriTreatmentModel {
  int id;
  String alamat;
  double total_harga;
  String status;
  String user_id;
  DateTime tanggal_pembelian;

  HistoriTreatmentModel({
    this.id,
    this.alamat,
    this.total_harga,
    this.status,
    this.user_id,
    this.tanggal_pembelian,
  });

  HistoriTreatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alamat = json['alamat'].toString();
    status = json['status'].toString();
    user_id = json['email'].toString();
    tanggal_pembelian = DateTime.parse(json['tanggal_pembelian'] as String);
    total_harga = double.parse(json['total_harga'].toString());
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'alamat': alamat,
      'status': status,
      'user_id': user_id,
      'total_harga': total_harga,
      'tanggal_pembelian': tanggal_pembelian,
    };
  }
}
