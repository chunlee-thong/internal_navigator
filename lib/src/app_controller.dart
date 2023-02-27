import 'package:flutter/material.dart';

class AppControler extends ChangeNotifier {
  bool isLoggedIn = false;

  String product = "";

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  void setProduct(String p) {
    product = p;
  }
}

final appController = AppControler();
