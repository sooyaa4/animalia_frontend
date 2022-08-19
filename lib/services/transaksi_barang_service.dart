import 'dart:convert';

import 'package:animalia_frontend/models/cart_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class TransaksiBarangService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
    double subTotal,
    String tanggalPembelian,
    String alamat,
    // String kurir,
  ) async {
    var url = Uri.parse('$baseUrl/cobarang');
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        "alamat": alamat,
        'items': carts
            .map(
              (cart) => {
                'id': cart.product.id,
                'jumlah_pesan': cart.jumlah_pesan,
              },
            )
            .toList(),
        "total_harga": totalPrice,
        "subtotal": subTotal,
        "metode_id": 1,
        "jenisKirim_id": 1,
        "tanggal_pembelian": tanggalPembelian,
        "url": "aaaq.png",
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      print(Exception);
      throw Exception('Gagal melakukan checkout');
    }
  }
}
