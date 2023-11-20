import 'package:apaixonautas_site/core/utils/app_assets.dart';
import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/user/login/components/textform_email.dart';
import 'package:apaixonautas_site/user/login/components/textform_password.dart';
import 'package:apaixonautas_site/user/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPageWeb extends StatelessWidget {
  final LoginController loginController;
  const LoginPageWeb({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundMax),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            height: mediaQuery.height * 0.8,
            width: 450,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: Image.asset(
                      AppAssets.astronautLoginPNG,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Form(
                        key: loginController.formKey,
                        child: Column(
                          children: [
                            Flexible(
                              child: TextFormFieldEmail(
                                  loginController: loginController),
                            ),
                            const SizedBox(height: 16),
                            Flexible(
                              child: TextFormFieldPassWord(
                                  loginController: loginController),
                            ),
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: SizedBox(
                        width: double.infinity,
                        height: 40,
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
