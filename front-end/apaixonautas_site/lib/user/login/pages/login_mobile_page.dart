import 'package:apaixonautas_site/core/utils/app_assets.dart';
import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/user/login/components/textform_email.dart';
import 'package:apaixonautas_site/user/login/components/textform_password.dart';
import 'package:apaixonautas_site/user/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPageMobile extends StatelessWidget {
  final LoginController loginController;
  const LoginPageMobile({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Form(
              key: loginController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.astronautLoginPNG,
                    width: 240,
                    height: 240,
                  ),
                  Text(
                    'Fazer Login',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins700,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Bem-Vindo de volta, senti sua falta!',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormFieldEmail(loginController: loginController),
                  const SizedBox(height: 16),
                  TextFormFieldPassWord(loginController: loginController),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          loginController.clickInForgetNetwork(context);
                        },
                        child: const Text('Esqueci minha senha'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        loginController.clickInLogin();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: AppFonts.poppins700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
