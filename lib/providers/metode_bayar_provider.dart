import 'package:animalia_frontend/models/metode_bayar.dart';
import 'package:animalia_frontend/services/metode_bayar_service.dart';
import 'package:flutter/widgets.dart';

class MetodeBayarProvider with ChangeNotifier {
  List<MetodeBayarModel> _bayars = [];
  List<MetodeBayarModel> get bayar => _bayars;

  set bayars(List<MetodeBayarModel> bayars) {
    _bayars = bayars;
    notifyListeners();
  }

  Future<void> getMetodeBayar() async {
    try {
      List<MetodeBayarModel> bayars =
          await MetodeBayarService().getMetodeBayar();
      _bayars = bayars;
    } catch (e) {
      print(e);
    }
  }
}
