import 'package:animalia_frontend/models/cart_treatment_model.dart';
import 'package:animalia_frontend/models/treatment_model.dart';
import 'package:flutter/material.dart';

class CartTreatmentProvider with ChangeNotifier {
  List<CartTreatmentModel> _carts = [];
  List<CartTreatmentModel> get carts => _carts;
  String alamat;

  set carts(List<CartTreatmentModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(TreatmentModel treatment) {
    if (productExist(treatment)) {
      int index =
          _carts.indexWhere((element) => element.treatment.id == treatment.id);
      _carts[index].jumlah_pesan_jasa++;
    } else {
      _carts.add(
        CartTreatmentModel(
          id: _carts.length,
          treatment: treatment,
          jumlah_pesan_jasa: 1,
        ),
      );
    }
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].jumlah_pesan_jasa++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].jumlah_pesan_jasa--;
    if (_carts[id].jumlah_pesan_jasa == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.jumlah_pesan_jasa;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.jumlah_pesan_jasa * item.treatment.harga);
    }
    return total;
  }

  productExist(TreatmentModel treatment) {
    if (_carts.indexWhere((element) => element.treatment.id == treatment.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  subTotal() {
    double subtotal = 0;
    subtotal += (totalPrice() + 30000);
    return subtotal;
  }

  tanggalPembelian() {
    String now = DateTime.now().toString();
    print(now);
    return now;
  }
}
