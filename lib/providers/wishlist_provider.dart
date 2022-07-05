import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier {
  List<ProductBarangModel> _wishlist = [];
  List<ProductBarangModel> get wishlist => _wishlist;

  set wishlist(List<ProductBarangModel> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setProduct(ProductBarangModel product) {
    if (!isWishlist(product)) {
      _wishlist.add(product);
    } else {
      _wishlist.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }

  isWishlist(ProductBarangModel product) {
    if (_wishlist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
