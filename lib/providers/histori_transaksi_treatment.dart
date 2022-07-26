import 'package:animalia_frontend/models/histori_barang.dart';
import 'package:animalia_frontend/models/histori_treatment.dart';
import 'package:animalia_frontend/models/treatment_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/services/hisori_barang_service.dart';
import 'package:animalia_frontend/services/histori_treatment_service.dart';
import 'package:flutter/widgets.dart';

class HistoriTreatmentProvider with ChangeNotifier {
  List<HistoriTreatmentModel> _treatment = [];
  List<HistoriTreatmentModel> get treatment => _treatment;

  set transaksi(List<HistoriTreatmentModel> treatment) {
    _treatment = treatment;
    notifyListeners();
  }

  Future<void> getTransaksiTreatment(UserModel user) async {
    try {
      List<HistoriTreatmentModel> treatment =
          await HistoriTreatmentService().getTransaksiTreatment(user);
      _treatment = treatment;
    } catch (e) {
      print(e);
    }
  }
}
