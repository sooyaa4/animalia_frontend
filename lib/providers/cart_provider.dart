import 'package:animalia_frontend/models/cart_model.dart';
import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;
  String alamat;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductBarangModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].jumlah_pesan++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          jumlah_pesan: 1,
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
    _carts[id].jumlah_pesan++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].jumlah_pesan--;
    if (_carts[id].jumlah_pesan == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.jumlah_pesan;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.jumlah_pesan * item.product.harga);
    }
    return total;
  }

  productExist(ProductBarangModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }

  subTotal() {
    double subtotal = 0;
    subtotal += (totalPrice() + 10000);
    return subtotal;
  }

  tanggalPembelian() {
    String now = DateTime.now().toString();
    print(now);
    return now;
  }
}
