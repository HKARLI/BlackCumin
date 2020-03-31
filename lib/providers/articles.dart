import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/article.dart';
import '../const.dart';

class Articles with ChangeNotifier {
  List<Article> _articles = [];

  List<Article> get articles {
    return [..._articles];
  }

  Article findById(String id) {
    return _articles.firstWhere((article) => article.id == id);
  }

  Future<void> fetchAndSetArticles(int id) async {
    final url = FIREBASE_URL + 'articles.json';
    final List<Article> _loadedArticles = [];
    try {
      final response = await http.get(url);
      var articlesData = json.decode(response.body);
      if (articlesData[id] == null) {
        print("bbbb");
        return;
      }
      articlesData = articlesData[id];
      for (var i = 1; i < articlesData.length; i++) {
        _loadedArticles.add(Article(
          id: articlesData[i]['title'],
          title: articlesData[i]['title'],
          subtitle: articlesData[i]['subtitle'],
          content: articlesData[i]['content'],
          author: articlesData[i]['author'],
          readDuration: articlesData[i]['reading_duration'],
          imageUrl: articlesData[i]['image_url'],
          category: articlesData[i]['category'],
          publishDate: articlesData[i]['publish_date'],
        ));
      }
      _articles = _loadedArticles;
      notifyListeners();
    } 
    catch (error){
      throw (error);
    }
  }
}