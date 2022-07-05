import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<UserModel> register({
    String nama,
    String username,
    String email,
    String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'nama': nama,
      'username': username,
      'alamat': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      print(data[0]);
      return user;
    } else {
      throw Exception('Gagal Registrasi');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-type': 'applicatin/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
