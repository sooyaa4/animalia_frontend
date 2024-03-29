import 'package:animalia_frontend/models/cart_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/providers/auth_provider.dart';
import 'package:animalia_frontend/services/transaksi_barang_service.dart';
import 'package:flutter/widgets.dart';

class TransaksiBarangprovider with ChangeNotifier {
  String alamat;
  // String kurir;

  String get getAlamat {
    return alamat;
  }

  // String get getKurir {
  //   return kurir;
  // }

  // set setKurir(String kurir) {
  //   kurir = kurir;
  // }

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
    double subTotal,
    String tanggalPembelian,
    String alamat,
    // String kurir,
  ) async {
    try {
      if (await TransaksiBarangService().checkout(
        token,
        carts,
        totalPrice,
        subTotal,
        tanggalPembelian,
        alamat,
        // kurir,
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
