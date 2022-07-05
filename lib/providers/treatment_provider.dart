import 'package:animalia_frontend/models/treatment_model.dart';
import 'package:animalia_frontend/services/treatment_service.dart';
import 'package:flutter/cupertino.dart';

class TreatmentProvider with ChangeNotifier {
  List<TreatmentModel> _treatments = [];
  List<TreatmentModel> get treatments => _treatments;

  set treatments(List<TreatmentModel> treatments) {
    _treatments = treatments;
    notifyListeners();
  }

  Future<void> getTreatment() async {
    try {
      List<TreatmentModel> treatments = await TreatmentService().getTreatment();
      _treatments = treatments;
    } catch (e) {
      print(e);
    }
  }
}
