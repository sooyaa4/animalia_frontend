// ignore_for_file: non_constant_identifier_names, avoid_print

class PelangganModel {
  int id;
  String nama;
  String alamat;
  String username;
  num no_telp;

  PelangganModel({
    this.id,
    this.nama,
    this.alamat,
    this.username,
    this.no_telp,
  });

  PelangganModel.fromJson(Map<String, dynamic> json) {
    print('FROM JSON: $json');
    print('pelanggan id: ${json['id']}');
    // print('id: ${json['nama']}');
    id = json['id'];
    nama = json['nama'];
    username = json['username'];
    alamat = json['alamat'];
    no_telp = json['no_telp'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'username': username,
      'alamat': alamat,
      'no_telp': no_telp,
    };
  }
}
