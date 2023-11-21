import 'package:apaixonautas_site/core/models/data_model.dart';
import 'package:apaixonautas_site/core/utils/app_assets.dart';
import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/user/sign_up/components/text_form_custom.dart';
import 'package:apaixonautas_site/user/sign_up/controllers/signup_controller.dart';
import 'package:br_validators/masks/br_masks.dart';
import 'package:flutter/material.dart';

class SignUpWebPage extends StatelessWidget {
  final SignUpController signUpController;
  const SignUpWebPage({super.key, required this.signUpController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Data.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundMax),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 142.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        height: 550,
                        width: 750,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 32),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 32),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Cadastre-se',
                                        style: TextStyle(
                                          fontFamily: AppFonts.poppins700,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 32),
                                  child: Form(
                                    key: signUpController.formKey,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: CustomTextFormField(
                                                signUpController: signUpController,
                                                textController: signUpController.nameController,
                                                hintText: '* Nome e Sobrenome',
                                                validatorFunc: (String? e) {
                                                  return signUpController.validateName(e);
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 32),
                                            Flexible(
                                              child: CustomTextFormField(
                                                signUpController: signUpController,
                                                textController: signUpController.telephoneController,
                                                hintText: '* Telefone Celular',
                                                inputFormatters: [
                                                  BRMasks.mobilePhone
                                                ],
                                                validatorFunc: (String? e) {
                                                  return signUpController.validateTelephone(e);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 48),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: CustomTextFormField(
                                                signUpController: signUpController,
                                                textController: signUpController.cpfController,
                                                hintText: '* CPF',
                                                inputFormatters: [
                                                  BRMasks.cpf
                                                ],
                                                validatorFunc: (String? e) {
                                                  return signUpController.validateCpf(e);
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 32),
                                            Flexible(
                                              child: CustomTextFormField(
                                                signUpController: signUpController,
                                                textController: signUpController.birthController,
                                                hintText: '* Data de nascimento',
                                                inputFormatters: [
                                                  BRMasks.date
                                                ],
                                                validatorFunc: (String? e) {
                                                  return signUpController.validateDate(e);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 48),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: CustomTextFormField(
                                                signUpController: signUpController,
                                                textController: signUpController.emailController,
                                                hintText: '* E-mail',
                                                validatorFunc: (String? e) {
                                                  return signUpController.validateEmail(e);
                                                },
                                              ),
                                            ),
                                            const SizedBox(width: 32),
                                            Flexible(
                                              child: CustomTextFormField(
                                                signUpController: signUpController,
                                                textController: signUpController.passController,
                                                hintText: '* Senha',
                                                isPassword: true,
                                                validatorFunc: (String? e) {
                                                  return signUpController.validatePassword(e);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 100),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        signUpController.clickInCreateAccount();
                                      },
                                      child: Text(
                                        'Criar Conta',
                                        style: TextStyle(
                                          fontSize: 16,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Image.asset(
                          AppAssets.astronautSignUpPNG,
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
