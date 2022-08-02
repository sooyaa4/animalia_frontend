import 'package:animalia_frontend/models/cart_treatment_model.dart';
import 'package:animalia_frontend/services/transaksi_treatment_service.dart';
import 'package:flutter/cupertino.dart';

class TransaksiTreatmentProvider with ChangeNotifier {
  String alamat;

  String get getAlamat {
    return alamat;
  }

  set setAlamat(String alamat) {
    alamat = alamat;
  }

  Future<bool> checkout(
    String token,
    List<CartTreatmentModel> carts,
    double totalPrice,
    double subTotal,
    String tanggalPembelian,
    String alamat,
  ) async {
    try {
      if (await TransaksiTreatmentService().checkout(
        token,
        carts,
        totalPrice,
        subTotal,
        tanggalPembelian,
        alamat,
      )) {
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
