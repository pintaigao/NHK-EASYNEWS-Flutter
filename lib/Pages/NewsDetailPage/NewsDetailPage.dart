import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nhkeasynews/store/main.dart';
import 'package:nhkeasynews/utility/rubyword/rubyword.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsDetailsPage extends StatefulWidget {
  final int index;

  NewsDetailsPage(this.index);

  @override
  State<StatefulWidget> createState() {
    return _NewsDetailPageState();
  }
}

class _NewsDetailPageState extends State<NewsDetailsPage> {

  Widget _buildTitle(BuildContext context, MainModel model) {
    Map<String, dynamic> title =
        model.newsdetail == null ? null : model.newsdetail.title;
    if (title == null) {
      return new Container();
    }
    List<Widget> list = new List();

    title.forEach((String key, dynamic value) {
      if (key.contains("content")) {
        for (int i = 0; i < value.length; i++) {
          var char = value[i];
          list.add(new RW("", char));
        }
      } else {
        list.add(new RW(key, value));
      }
    });

    return new Container(
      margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: list,
      ),
    );
  }

  Widget _buildArticle(BuildContext context, MainModel model) {
    List<dynamic> articleList =
        model.newsdetail == null ? null : model.newsdetail.Content;

    if (articleList == null) {
      return new Container();
    }
    List<Widget> list = new List();
    articleList.forEach((dynamic article) {
      if (article.length == 0) {
        return;
      }
      List<Widget> eacharticle = new List();

      eacharticle.add(SizedBox(
        width: 50.0,
      ));

      article.forEach((String key, dynamic value) {
        if (key.contains("content")) {
          for (int i = 0; i < value.length; i++) {
            var char = value[i];
            eacharticle.add(new RW("", char));
          }
        } else {
          eacharticle.add(new RW(key, value));
        }
      });

      list.add(new Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: eacharticle,
      ));

      list.add(new SizedBox(
        height: 20.0,
        child: new Container(
        ),
      ));
    });

    return new Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 8.0,
        margin: EdgeInsets.only(top: 0.0,left: 8.0,right: 8.0,bottom: 0.0),
        child: new Container(
            padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 10.0),
            child: new Column(
              children: <Widget>[
                new Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: list,
                ),
              ],
            )));
  }

  Widget _buildHeaderImage(BuildContext context, MainModel model){
    var imageData = model.allNewsList[widget.index].news_photo;
    if(imageData == null){
      return new Container();
    }
    return Image.memory(Base64Codec().decode(imageData), fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("News"),
      ),
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          Widget content = new Container(
            alignment: Alignment.topCenter,
            child: new SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 50.0),
              child: new Column(
                children: <Widget>[
                  _buildTitle(context, model),
                  _buildHeaderImage(context,model),
                  SizedBox(
                    width: 20.0,
                    height: 20.0,
                  ),
                  _buildArticle(context, model),
                ],
              ),
            ),
          );
          if (model.newsDetailLoading) {
            content = Center(child: CircularProgressIndicator());
          }
          return content;
        },
      ),
    );
  }
}
