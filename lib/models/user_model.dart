import 'package:animalia_frontend/models/pelanggan_model.dart';

class UserModel {
  int id;
  String email;
  String nama;
  String username;
  String token;
  // PelangganModel pelanggan;

  UserModel({
    this.id,
    this.email,
    this.token,
    this.nama,
    this.username,
    // this.pelanggan,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    print('id: ${json['id']}');

    id = json['id'];
    email = json['email'];
    nama = json['nama'];
    username = json['username'];
    token = json['token'];
    // pelanggan = PelangganModel.fromJson(json['pelanggan']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'nama': nama,
      'username': username,
      'token': token,
      // 'pelanggan': pelanggan.toJson(),
    };
  }
}
