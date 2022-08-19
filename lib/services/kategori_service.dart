// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:animalia_frontend/models/category_model.dart';
import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:http/http.dart' as http;

class KategoriBarangService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<CategoryModel>> getKategori() async {
    var url = Uri.parse('$baseUrl/kategori');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<CategoryModel> kats = [];

      for (var item in data) {
        kats.add(CategoryModel.fromJson(item));
      }

      return kats;
    } else {
      throw Exception('Gagal Get Product');
    }
  }
}
