// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:http/http.dart' as http;

class ProductBarangService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<ProductBarangModel>> getProduk() async {
    var url = Uri.parse('$baseUrl/produk');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductBarangModel> products = [];

      for (var item in data) {
        products.add(ProductBarangModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Product');
    }
  }
}
