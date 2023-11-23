import 'package:apaixonautas_site/user/login/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    }
  }

  void clickInForgetNetwork(BuildContext context) {
    context.go('/recuperar-senha');
  }
}
