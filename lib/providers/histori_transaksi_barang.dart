import 'package:animalia_frontend/models/histori_barang.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/services/hisori_barang_service.dart';
import 'package:flutter/widgets.dart';

class HistoriBarangProvider with ChangeNotifier {
  List<HistoryBarangModel> _transaksi = [];
  List<HistoryBarangModel> get transaksi => _transaksi;

  set transaksi(List<HistoryBarangModel> transaksi) {
    _transaksi = transaksi;
    notifyListeners();
  }

  Future<void> getTransaksiBarang(UserModel user) async {
    try {
      List<HistoryBarangModel> transaksi =
          await HistoriBarangService().getTransaksiBarang(user);
      _transaksi = transaksi;
    } catch (e) {
      print(e);
    }
  }
}
