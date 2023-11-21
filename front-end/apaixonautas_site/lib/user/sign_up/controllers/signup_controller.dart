import 'package:apaixonautas_site/core/functions/functions.dart';
import 'package:br_validators/validators/br_validators.dart';
import 'package:flutter/material.dart';

class SignUpController {
  SignUpController();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final ValueNotifier<bool> showPassword = ValueNotifier(false);

  void changeVisibility() {
    showPassword.value = !showPassword.value;
  }

  void clickInCreateAccount() {
    if (formKey.currentState!.validate()) {
      print('valid');
    }
  }

  String? validateCpf(String? text) {
    if (text == null || text.isEmpty) {
      return 'Informe seu CPF!';
    } else if (!BRValidators.validateCPF(text)) {
      return 'CPF inválido';
    }
    return null;
  }

  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return 'Informe seu nome e sobrenome!';
    } else if (text.trim().length > 40) {
      return 'Máximo 40 caracteres!';
    } else if (text.trim().split(" ").length < 2) {
      return "Informe seu nome e sobrenome!";
    }
    return null;
  }

  String? validateTelephone(String? text) {
    if (text == null || text.isEmpty) {
      return 'Informe o telefone';
    } else if (text.length != 15) {
      return 'Utilize o formato (00) 00000-0000';
    }
    return null;
  }

  String? validateDate(String? text) {
    if (text == null || text.isEmpty || text.length != 10) {
      return 'Informe a data de nascimento';
    } else if (!Functions().isValidDate(text)) {
      return 'Data inválida';
    } else if (!Functions().isNotFutureDate(text)) {
      return 'Não pode ser uma data futura';
    }

    return null;
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty) {
      return 'Informe o E-mail';
    } else if (!text.contains('@') ||!RegExp(r"^[a-zA-Z0-9_\-.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)) {
      return "Utilize o formato nome@exemplo.com";
    }
    //TODO: Verificar se ja nao está cadastrado.
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'Informe sua senha!';
    } else if (text.length > 20) {
      return 'Máximo 20 caracteres!';
    } else if (text.length < 6) {
      return 'Restam ${6 - passController.text.length} caracteres';
    } else if (Functions().validaCaracterIndentico(text)) {
      return 'Caracteres idênticos são inválidos!';
    } else if (Functions().validaCaracterNumSeq(text) ||
        Functions().validaCaracterLetrasSeq(text)) {
      return 'Caracteres sequenciais são inválidos!';
    }
    return null;
  }
}
