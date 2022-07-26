// ignore_for_file: non_constant_identifier_names

class MetodeBayarModel {
  int id;
  String nama_metode;
  int nomer_rek;

  MetodeBayarModel({
    this.id,
    this.nama_metode,
    this.nomer_rek,
  });

  MetodeBayarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_metode = json['nama_metode'];
    nomer_rek = json['nomer_rek'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_metode': nama_metode,
      'nomer_rek': nomer_rek,
    };
  }
}
