// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:animalia_frontend/models/pelanggan_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class FetchDataService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  UserModel user;

  Future<PelangganModel> getDataPengguna() async {
    UserModel user;
    var id = user.id;
    var url = Uri.parse('$baseUrl/fetch/$id');
    var headers = {
      'Content-type': 'application/json',
      'Authorization': user.token,
    };
    var body = jsonEncode(
      {'user_id': user.token},
    );
    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      PelangganModel pelanggan = PelangganModel.fromJson(data['data']);

      return pelanggan;
    } else {
      throw Exception('Gagal mengambil data pelanggan');
    }
  }
}
