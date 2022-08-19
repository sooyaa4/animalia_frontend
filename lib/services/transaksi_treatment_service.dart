import 'dart:convert';

import 'package:animalia_frontend/models/cart_treatment_model.dart';
import 'package:http/http.dart' as http;

class TransaksiTreatmentService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<bool> checkout(
    String token,
    List<CartTreatmentModel> carts,
    double totalPrice,
    double subTotal,
    String tanggalPembelian,
    String alamat,
    String tanggalBooking,
  ) async {
    var url = Uri.parse('$baseUrl/cotreatment');
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'alamat': alamat,
        'items': carts
            .map(
              (cart) => {
                'id': cart.treatment.id,
                'jumlah_pesan_jasa': cart.jumlah_pesan_jasa,
              },
            )
            .toList(),
        "status": "PENDING",
        "total_harga": totalPrice,
        "subtotal": subTotal,
        "metode_id": 1,
        "layanan_id": 1,
        "tanggal_pembelian": tanggalPembelian,
        "tanggal_booking": tanggalBooking,
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
