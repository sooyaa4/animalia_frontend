// ignore_for_file: avoid_print

import 'package:animalia_frontend/models/pelanggan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    print('token: ${json['token']}');
    //print('pelanggan : ${json['pelanggan']}');

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

  Future<bool> setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
