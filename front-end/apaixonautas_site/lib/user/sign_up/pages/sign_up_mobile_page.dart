import 'package:apaixonautas_site/core/utils/app_assets.dart';
import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/user/sign_up/components/text_form_custom.dart';
import 'package:apaixonautas_site/user/sign_up/controllers/signup_controller.dart';
import 'package:br_validators/masks/br_masks.dart';
import 'package:flutter/material.dart';

class SignUpMobilePage extends StatelessWidget {
  final SignUpController signUpController;
  const SignUpMobilePage({super.key, required this.signUpController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Form(
              key: signUpController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.astronautSignUpPNG,
                    width: 240,
                    height: 240,
                  ),
                  Text(
                    'Criar Conta',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins700,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Olá, vamos nos conhecer melhor?',
                    style: TextStyle(
                      fontFamily: AppFonts.poppins400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomTextFormField(
                    signUpController: signUpController,
                    textController: signUpController.nameController,
                    hintText: '* Nome e Sobrenome',
                    validatorFunc: (String? e) {
                      return signUpController.validateName(e);
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomTextFormField(
                    signUpController: signUpController,
                    textController: signUpController.telephoneController,
                    hintText: '* Telefone Celular',
                    inputFormatters: [BRMasks.mobilePhone],
                    validatorFunc: (String? e) {
                      return signUpController.validateTelephone(e);
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomTextFormField(
                    signUpController: signUpController,
                    textController: signUpController.cpfController,
                    hintText: '* CPF',
                    inputFormatters: [BRMasks.cpf],
                    validatorFunc: (String? e) {
                      return signUpController.validateCpf(e);
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomTextFormField(
                    signUpController: signUpController,
                    textController: signUpController.birthController,
                    hintText: '* Data de nascimento',
                    inputFormatters: [BRMasks.date],
                    validatorFunc: (String? e) {
                      return signUpController.validateDate(e);
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomTextFormField(
                    signUpController: signUpController,
                    textController: signUpController.emailController,
                    hintText: '* E-mail',
                    validatorFunc: (String? e) {
                      return signUpController.validateEmail(e);
                    },
                  ),
                  const SizedBox(height: 32),
                  CustomTextFormField(
                    signUpController: signUpController,
                    textController: signUpController.passController,
                    hintText: '* Senha',
                    isPassword: true,
                    validatorFunc: (String? e) {
                      return signUpController.validatePassword(e);
                    },
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        signUpController.clickInCreateAccount();
                      },
                      child: Text(
                        'Criar Conta',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: AppFonts.poppins700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
