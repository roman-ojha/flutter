import 'package:flutter/material.dart';
import 'package:flutter_testing_tutorial/article.dart';
import 'package:flutter_testing_tutorial/news_service.dart';

class NewsChangeNotifier extends ChangeNotifier {
  final NewsService _newsService;

  NewsChangeNotifier(this._newsService);
  // and we are getting data through './news_services'

  List<Article> _articles = [];

  List<Article> get articles => _articles;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getArticles() async {
    await _newsService.getArticles();
    // now here we will just return the article that is provided by 'NewsService'
  }
}
