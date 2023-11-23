import 'package:apaixonautas_site/news/models/news_model.dart';
import 'package:apaixonautas_site/news/repository/news_repository.dart';
import 'package:flutter/material.dart';

class NewsController extends ChangeNotifier {
  final ScrollController scrollController;
  NewsController({required this.scrollController}) {
    fetchNewsOfDay();

    scrollController.addListener(() {
      if ((scrollController.position.pixels.truncate() >= scrollController.position.maxScrollExtent ~/ 2) && !loadingMoreNotifier.value) {
        loadMoreNews();
      }
    });
  }

  late List<NewsModel> newsList = [];
  bool get hasNewsOfDay => newsList.isNotEmpty;

  final loadingNotifier = ValueNotifier<bool>(false);
  final loadingMoreNotifier = ValueNotifier<bool>(false);

  bool itsOk = false;

  String? nextPage;
  String? previousPage;

  void setLoading(bool value) {
    loadingNotifier.value = value;
  }

  void setLoadingMore(bool value) {
    loadingMoreNotifier.value = value;
  }

  Future<void> fetchNewsOfDay() async {
    setLoading(true);
    newsList.clear();

    final response = await NewsRepository().fetchNewsOfDay();

    if (response != null && response.isNotEmpty) {
      newsList = response['list'] ?? [];
      nextPage = response['nextPage'];
      previousPage = response['previousPage'];
    }

    // //TODO: BUSCAR OS LIKES NO BANCO
    // //id: 1234
    // //likes: 5

    // List listOflIKES = []; //Banco

    // for (var newsItem in newsList) {
    //   if (listOflIKES.contains(newsItem.id)) {
    //     newsItem.likes = listOflIKES.likes;
    //   }
    // }

    notifyListeners();
    setLoading(false);
  }

  Future<void> loadMoreNews() async {
    setLoadingMore(true);
    if (nextPage != null) {
      final response = await NewsRepository().fetchNewsOfDay(page: nextPage);

      if (response != null && response.isNotEmpty && response['list'] != null) {
        final List<NewsModel> list = response['list'];
        for (NewsModel news in list) {
          newsList.add(news);
        }
        nextPage = response['nextPage'];
        previousPage = response['previousPage'];
      }
    }
    notifyListeners();
    setLoadingMore(false);
  }
}
