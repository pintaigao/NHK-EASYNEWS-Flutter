import 'package:flutter/material.dart';

class NewsList {
  final String news_id;
  final String title;
  final String title_with_ruby;
  final String news_web_img_uri;
  final String news_prearranged_time;
  final String news_web_url;

  NewsList({
    @required this.news_id,
    @required this.title,
    @required this.title_with_ruby,
    this.news_web_img_uri = "",
    @required this.news_prearranged_time,
    @required this.news_web_url
  });
}
