import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsInfoRequired {
  String? title;
  String? summary;
  String? published;
  bool? isFav;

  NewsInfoRequired({this.title, this.summary, this.published, this.isFav});
}

class NewsProvider extends ChangeNotifier {
  List<NewsInfoRequired> _newsfromAPI = [];
  List<NewsInfoRequired> _newsAddedtoFavs = [];
  List<NewsInfoRequired> get currentNews {
    return [..._newsfromAPI];
  }

  List<NewsInfoRequired> get favoriteNews {
    return [..._newsAddedtoFavs];
  }

  void handleFavourites(int index) {
    if (_newsfromAPI[index].isFav == true) {
      _newsfromAPI[index].isFav = false;
      _newsAddedtoFavs.remove(_newsfromAPI[index]);
    } else {
      _newsfromAPI[index].isFav = true;
      _newsAddedtoFavs.add(_newsfromAPI[index]);
    }
    notifyListeners();
  }

  void removeFromFav(NewsInfoRequired newsData) {
    _newsAddedtoFavs.remove(newsData);
    int removeIndex = _newsfromAPI.indexWhere((element) => element == newsData);
    _newsfromAPI[removeIndex].isFav = false;
    notifyListeners();
  }

  Future<void> getNews() async {
    String apiUrl = "https://api.first.org/data/v1/news/";
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);
    //print(json.decode(response.body));
    var result = jsonDecode(response.body)['data'] as List;
    result.forEach((element) {
      _newsfromAPI.add(NewsInfoRequired(
        title: element['title'],
        summary: element['summary'],
        published: element['published'],
        isFav: false,
      ));
    });
    notifyListeners();
  }
}