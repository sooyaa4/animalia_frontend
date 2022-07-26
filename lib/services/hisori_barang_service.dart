import 'package:animalia_frontend/models/histori_barang.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoriBarangService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<HistoryBarangModel>> getTransaksiBarang(UserModel user) async {
    var id = user.id;
    var url = Uri.parse('$baseUrl/transactions/$id');
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
      List data = jsonDecode(response.body)['data'];
      List<HistoryBarangModel> transaction = [];

      for (var item in data) {
        transaction.add(HistoryBarangModel.fromJson(item));
      }
      //print(transaction);

      return transaction;
    } else {
      throw Exception('Gagal mengambil transaksi');
    }
  }
}
