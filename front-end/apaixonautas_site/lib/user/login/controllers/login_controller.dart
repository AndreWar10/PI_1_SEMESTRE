import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController emailController;
  final TextEditingController passController;

  LoginController({
    required this.emailController,
    required this.passController,
  });

  final formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> showPassword = ValueNotifier(false);

  void changeVisibility() {
    showPassword.value = !showPassword.value;
  }

  void clickInLogin() {
    if (formKey.currentState!.validate()) {
      print('dfsfs');
    }
  }

  void clickInForgetNetwork(BuildContext context) {
    Navigator.of(context).pushNamed('/recover-pass');
  }
}
