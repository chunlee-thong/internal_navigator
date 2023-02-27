import 'package:flutter/material.dart';
import 'package:internal_navigator/src/app_controller.dart';
import 'package:skadi/skadi.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            SkadiNavigator.pushAndRemove(context, const HomePage());
            appController.login();
          },
          child: const Text("Login Anonymously"),
        ),
      ),
    );
  }
}
