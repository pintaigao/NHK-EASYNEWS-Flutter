import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nhkeasynews/models/NewsDetail.dart';
import 'package:nhkeasynews/models/NewsList.dart';
import 'package:scoped_model/scoped_model.dart';

class ConnectedProductsModel extends Model {
  bool _isLoading = false;
  List<NewsList> _newsList = [];
  NewsDetail _newsDetail;
}

class NewsListModel extends ConnectedProductsModel {

  // Getter
  List<NewsList> get allNewsList {
    return List.from(_newsList);
  }

  NewsDetail get newsdetail {
    return _newsDetail;
  }

  bool get isLoading{
    return _isLoading;
  }


  Future<dynamic> startGetAllNewsList() {
    _isLoading = true;
    return http.get("http://localhost:8080/api/news").then((http.Response response) {
      final List<NewsList> fetchNewsList = [];
      List<dynamic> newslistData = json.decode(response.body);
      if (newslistData == null) {
        return;
      }
      newslistData.forEach((dynamic newsdata) {
        final NewsList newsList = NewsList(
            news_id: newsdata["news_id"],
            title: newsdata["title"],
            title_with_ruby: newsdata["title_with_ruby"],
            news_web_img_uri: newsdata["news_web_image_uri"],
            news_prearranged_time: newsdata["news_prearranged_time"],
            news_web_url: newsdata["news_web_url"]);
            fetchNewsList.add(newsList);
      });
      _isLoading = false;
      print(_isLoading);
      _newsList = fetchNewsList;
      print("have fetch the news");
      notifyListeners();
    }).catchError((error){
      _isLoading = false;
      print(error);
      return;
    });
  }

  /* Get News Detail */
  Future<dynamic> startGetNewsDetail()  {
    _isLoading = true;
    notifyListeners();
    return http.get("http://localhost:8080/api/news/k10011579301000").then((http.Response response) {
      final Map<String,dynamic> newsDetail = json.decode(response.body);
      if (newsDetail == null) {
        return;
      }
      final Map<String,dynamic> newsTitle = newsDetail["title"][0];
      final Map<String,dynamic> publicDate = newsDetail["public_time"][0];
      final List<dynamic> article = newsDetail["article"];
      final NewsDetail nw = new NewsDetail(newsTitle, publicDate, article);
      _isLoading = false;
      _newsDetail = nw;
      notifyListeners();
    }).catchError((error){
      _isLoading = false;
      print(error);
      return;
    });
  }

}
