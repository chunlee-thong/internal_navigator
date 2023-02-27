import 'package:flutter/material.dart';

class AppControler extends ChangeNotifier {
  bool isLoggedIn = false;

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }
}

final appController = AppControler();
