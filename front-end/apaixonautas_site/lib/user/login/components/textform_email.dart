import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/user/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class TextFormFieldPassWord extends StatelessWidget {
  const TextFormFieldPassWord({
    super.key,
    required this.loginController,
  });

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.showPassword,
      builder: (_, show, __) {
        return TextFormField(
          controller: loginController.passController,
          obscureText: show ? false : true,
          style: TextStyle(fontFamily: AppFonts.poppins400),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: 'Senha',
            errorStyle: TextStyle(fontFamily: AppFonts.poppins400),
            suffixIcon: GestureDetector(
              onTap: () {
                loginController.changeVisibility();
              },
              child: Icon(
                show ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          validator: (typedText) {
            if (typedText == null || typedText.isEmpty) {
              return 'Preencha o campo!';
            }
            return null;
          },
        );
      },
    );
  }
}
