import 'package:animalia_frontend/models/metode_kirim.dart';
import 'package:animalia_frontend/services/jenis_pengiriman.dart';
import 'package:flutter/widgets.dart';

class JenisKirimProvider with ChangeNotifier {
  List<MetodKirimModel> _kirims = [];
  List<MetodKirimModel> get kirim => _kirims;

  set kirims(List<MetodKirimModel> kirims) {
    _kirims = kirims;
    notifyListeners();
  }

  Future<void> getJenisKirim() async {
    try {
      List<MetodKirimModel> kirims = await JenisKirimService().getJenisKirim();
      _kirims = kirims;
    } catch (e) {
      print(e);
    }
  }
}
