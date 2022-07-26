import 'dart:convert';

import 'package:animalia_frontend/models/cart_model.dart';
import 'package:animalia_frontend/models/cart_treatment_model.dart';
import 'package:http/http.dart' as http;

class TransaksiTreatmentService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<bool> checkout(
    String token,
    List<CartTreatmentModel> carts,
    double totalPrice,
  ) async {
    var url = Uri.parse('$baseUrl/cotreatment');
    var headers = {
      'Content-type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'alamat': 'Marsemoon',
        'items': carts
            .map(
              (cart) => {
                'id': cart.treatment.id,
                'jumlah_pesan_jasa': cart.jumlah_pesan_jasa,
              },
            )
            .toList(),
        "status": "PENDING",
        "total_harga": 2000,
        "subtotal": 2100,
        "metode_id": 1,
        "layanan_id": 1,
        "tanggal_pembelian": "2022-07-21",
        "tanggal_booking": "2022-07-21",
        "url": "aaa.png"
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
      throw Exception('Gagal melakukan pesan treatment');
    }
  }
}
