import 'package:animalia_frontend/models/pelanggan_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/services/fetch_data.dart';
import 'package:flutter/widgets.dart';

class FetchDataProvider with ChangeNotifier {
  PelangganModel _pelanggan;

  PelangganModel get pelanggan => _pelanggan;

  set pelanggan(PelangganModel pelanggan) {
    _pelanggan = pelanggan;
    notifyListeners();
  }

  Future<void> getDataPelanggan(UserModel user) async {
    try {
      PelangganModel pelanggan =
          await FetchDataService().getDataPelanggan(user);
      _pelanggan = pelanggan;

      print(_pelanggan);
    } catch (e) {
      print(e);
    }
  }
}
