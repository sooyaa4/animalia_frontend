import 'package:animalia_frontend/models/pelanggan_model.dart';
import 'package:animalia_frontend/models/user_model.dart';
import 'package:animalia_frontend/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String nama,
    String username,
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        nama: nama,
        username: username,
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login(
      {String name, String username, String email, String password}) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
