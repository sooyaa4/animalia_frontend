import 'package:animalia_frontend/models/cart_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/services/transaksi_barang_service.dart';
import 'package:flutter/widgets.dart';

class TransaksiBarangprovider with ChangeNotifier {
  String alamat;

  String get getAlamat {
    return alamat;
  }

  set setAlamat(String alamat) {
    alamat = alamat;
  }

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
    double subTotal,
    String alamat,
  ) async {
    try {
      if (await TransaksiBarangService().checkout(
        token,
        carts,
        totalPrice,
        subTotal,
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
