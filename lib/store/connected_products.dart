import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nhkeasynews/models/NewsDetail.dart';
import 'package:nhkeasynews/models/NewsList.dart';
import 'package:scoped_model/scoped_model.dart';

class ConnectedProductsModel extends Model {
  bool _isLoading = false;
  bool _newsDetailLoading = false;
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

  bool get isLoading {
    return _isLoading;
  }

  bool get newsDetailLoading {
    return _newsDetailLoading;
  }

  Future<dynamic> startGetAllNewsList() {
    _isLoading = true;
    notifyListeners();
    return http.get("http://nhk-server.us-east-1.elasticbeanstalk.com/api/news").then((http.Response response) {
//    return http
//        .get("http://localhost:8080/api/news")
//        .then((http.Response response) {
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
            news_web_url: newsdata["news_web_url"],
            news_photo: newsdata["news_img"]);
        fetchNewsList.add(newsList);
      });
      _isLoading = false;
      _newsList = fetchNewsList;
      notifyListeners();
    }).catchError((error) {
      _isLoading = false;
      print(error);
      return;
    });
  }

  /* Get News Detail */
  Future<dynamic> startGetNewsDetail(int index) {
    _newsDetailLoading = true;
    var newsId = allNewsList[index].news_id;
    print(newsId);
    /*return http
        .get("http://localhost:8080/ap"
        .then((http.Response response)*/
        return http.get("http://nhk-server.us-east-1.elasticbeanstalk.com/api/news/" + newsId)
        .then((http.Response response) {
      final Map<String, dynamic> newsDetail = json.decode(response.body);
      if (newsDetail == null) {
        return;
      }
      final Map<String, dynamic> newsTitle = newsDetail["title"][0];
      final Map<String, dynamic> publicDate = newsDetail["public_time"][0];
      final List<dynamic> article = newsDetail["article"];
      final NewsDetail nw = new NewsDetail(newsTitle, publicDate, article);
      _newsDetailLoading = false;
      _newsDetail = nw;
      notifyListeners();
    }).catchError((error) {
      _newsDetailLoading = false;
      print(error);
      return;
    });
  }
}
