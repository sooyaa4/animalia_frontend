import 'package:animalia_frontend/models/cart_model.dart';
import 'package:animalia_frontend/services/transaksi_barang_service.dart';
import 'package:flutter/widgets.dart';

class TransaksiBarangprovider with ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransaksiBarangService().checkout(token, carts, totalPrice)) {
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
