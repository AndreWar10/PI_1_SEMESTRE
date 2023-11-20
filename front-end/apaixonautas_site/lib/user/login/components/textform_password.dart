import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/user/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class TextFormFieldEmail extends StatelessWidget {
  const TextFormFieldEmail({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginController.emailController,
      style: TextStyle(
        fontFamily: AppFonts.poppins400,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        hintText: 'Usuário',
        errorStyle: TextStyle(fontFamily: AppFonts.poppins400),
      ),
      validator: (typedText) {
        if (typedText == null || typedText.isEmpty) {
          return 'Preencha o campo!';
        }
        return null;
      },
    );
  }
}