import 'dart:convert';

import 'package:animalia_frontend/models/treatment_model.dart';
import 'package:http/http.dart' as http;

class TreatmentService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<TreatmentModel>> getTreatment() async {
    var url = Uri.parse('$baseUrl/treatment');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<TreatmentModel> treatments = [];

      for (var item in data) {
        treatments.add(TreatmentModel.fromJson(item));
      }

      return treatments;
    } else {
      throw Exception('Gagal Get Data treatment');
    }
  }
}
