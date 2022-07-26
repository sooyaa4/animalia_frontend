// ignore_for_file: non_constant_identifier_names

class MetodKirimModel {
  int id;
  String nama_jenis_kirim;
  double ongkir;

  MetodKirimModel({
    this.id,
    this.nama_jenis_kirim,
    this.ongkir,
  });

  MetodKirimModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_jenis_kirim = json['nama_jenis_kirim'];
    ongkir = json['ongkir'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_jenis_kirim': nama_jenis_kirim,
      'ongkir': ongkir,
    };
  }
}
