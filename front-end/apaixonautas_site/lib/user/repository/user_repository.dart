import 'dart:convert';
import 'dart:io';
import 'package:apaixonautas_site/core/exceptions.dart';
import 'package:apaixonautas_site/user/login/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<String?> createUser({required UserModel user}) async {
    try {
      var url = Uri.parse('http://localhost:8080/usuarios');
      var body = jsonEncode(user.toJson());
      
      debugPrint(body);

      var response = await http.post(url, body: jsonEncode(user.toJson()), headers: {'Content-Type': 'application/json'},);

      if (response.statusCode == 201) {
        String responseApi = response.body;
        return responseApi;
      } else {
        return null;
      }
    } on SocketException {
      throw NoInternetException('Sem Internet');
    } on HttpException {
      throw NoServiceFoundException('Sem servico');
    } on FormatException {
      throw InvalidFormatException('Formato inválido de dados');
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
