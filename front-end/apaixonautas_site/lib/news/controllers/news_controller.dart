import 'package:apaixonautas_site/news/models/news_model.dart';
import 'package:apaixonautas_site/news/repository/news_repository.dart';
import 'package:flutter/material.dart';

class NewsController extends ChangeNotifier {
  NewsController();

  late List<NewsModel> newsList = [];
  bool get hasNewsOfDay => newsList.isNotEmpty;

  bool itsOk = false;

  String? nextPage;
  String? previousPage;

  Future<List<dynamic>> fetchNewsOfDay() async {
    newsList.clear();

    final response = await NewsRepository().fetchNewsOfDay();

    if (response != null && response.isNotEmpty) {
      newsList = response['list'];
      nextPage = response['nextPage'];
      previousPage = response['previousPage'];
    }

    notifyListeners();
    return newsList;
  }

  Future<void> navigateToNextPage() async {
    if (nextPage != null) {
      newsList.clear();
      final response = await NewsRepository().fetchNewsOfDay(page: nextPage);

      if (response != null && response.isNotEmpty) {
        newsList = response['list'];
      }
    }
    notifyListeners();
  }
}
