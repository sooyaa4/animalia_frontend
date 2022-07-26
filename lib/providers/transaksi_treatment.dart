import 'package:animalia_frontend/models/cart_treatment_model.dart';
import 'package:animalia_frontend/services/transaksi_treatment_service.dart';
import 'package:flutter/cupertino.dart';

class TransaksiTreatmentProvider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartTreatmentModel> carts, double totalPrice) async {
    try {
      if (await TransaksiTreatmentService()
          .checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);

      return false;
    }
  }
}
