import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:animalia_frontend/services/product_barang_service.dart';
import 'package:flutter/widgets.dart';

class ProductBarangProvider with ChangeNotifier {
  List<ProductBarangModel> _products = [];
  List<ProductBarangModel> get products => _products;

  set products(List<ProductBarangModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductBarangModel> products =
          await ProductBarangService().getProduk();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
