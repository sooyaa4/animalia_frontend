import 'package:animalia_frontend/models/category_model.dart';
import 'package:animalia_frontend/models/product_barang_model.dart';
import 'package:animalia_frontend/services/kategori_service.dart';
import 'package:animalia_frontend/services/product_barang_service.dart';
import 'package:flutter/widgets.dart';

class KategoriProvider with ChangeNotifier {
  List<CategoryModel> _kats = [];
  List<CategoryModel> get kats => _kats;

  set kats(List<CategoryModel> kats) {
    _kats = kats;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<CategoryModel> kats = await KategoriBarangService().getKategori();
      _kats = kats;
    } catch (e) {
      print(e);
    }
  }
}
