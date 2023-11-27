import 'dart:convert';
import 'dart:io';
import 'package:apaixonautas_site/core/exceptions.dart';
import 'package:apaixonautas_site/core/utils/environment.dart';
import 'package:apaixonautas_site/news/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<Map<String, dynamic>?> fetchNewsOfDay({String? page}) async {
    try {
      var response = await http.get(
        Uri.parse(page ?? Environment.newsBaseUrl),
      );

      if (response.statusCode == 200) {
        var decodedResponse = await json.decode(response.body)['results'];
        String? nextPage = json.decode(response.body)['next'];
        String? previousPage = json.decode(response.body)['previous'];
        final List<NewsModel> news = [
          for (final e in decodedResponse) NewsModel.fromJson(e)
        ];
        final map = {
          'list': news,
          'previousPage': previousPage,
          'nextPage': nextPage
        };
        return map;
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
