// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:animalia_frontend/models/metode_bayar.dart';
import 'package:http/http.dart' as http;

class MetodeBayarService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<MetodeBayarModel>> getMetodeBayar() async {
    var url = Uri.parse('$baseUrl/metodbayar');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<MetodeBayarModel> kirims = [];

      for (var item in data) {
        kirims.add(MetodeBayarModel.fromJson(item));
      }

      return kirims;
    } else {
      throw Exception('Gagal Get Metode Bayar');
    }
  }
}
