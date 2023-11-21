import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/user/sign_up/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textController,
    required this.hintText,
    required this.signUpController,
    required this.validatorFunc,
    this.isPassword = false, 
    this.inputFormatters,
  });

  final TextEditingController textController;
  final SignUpController signUpController;
  final String hintText;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;
  final Function validatorFunc;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: signUpController.showPassword,
      builder: (_, showPass, __) {
        return TextFormField(
          controller: textController,
          style: TextStyle(fontFamily: AppFonts.poppins400),
          obscureText: isPassword ? showPass ? true : false : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            contentPadding: const EdgeInsets.only(bottom: 0.0, top: 0.0, left: 12),
            labelText: hintText,
            errorStyle: TextStyle(fontFamily: AppFonts.poppins400),
            suffixIcon: isPassword ? GestureDetector(
              onTap: () {
                signUpController.changeVisibility();
              },
              child: Icon(
                showPass ? Icons.visibility : Icons.visibility_off,
              ),
            ) : const SizedBox(),
          ),
          validator: (typedText) {
            final String? validation = validatorFunc(typedText);
            if(validation != null) {
              return validation;
            }
            return null;
          },
        );
      }
    );
  }
}
