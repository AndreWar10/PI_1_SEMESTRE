import 'dart:convert';
import 'dart:io';

import 'package:apaixontauta_app/core/environment.dart';
import 'package:apaixontauta_app/core/exceptions.dart';
import 'package:http/http.dart' as http;

class SolarSystemRepository {
  Future<List?> fetchPlanetsSolarSystem() async {
    try {
      var response = await http.get(Uri.parse(Environment.solarSystemBaseurl),
      );

      if (response.statusCode == 200) {
        var decodedResponse = await jsonDecode(utf8.decode(response.bodyBytes));
        return decodedResponse;
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
