import 'package:flutter/material.dart';
import 'package:nhkeasynews/store/main.dart';
import 'package:nhkeasynews/utility/rubyword/rubyword.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsDetailsPage_test extends StatefulWidget {
  final MainModel model;

  NewsDetailsPage_test(this.model);

  @override
  State<StatefulWidget> createState() {
    return _NewsDetailPage_testState();
  }
}

class _NewsDetailPage_testState extends State<NewsDetailsPage_test> {
  @override
  void initState() {
    widget.model.startGetNewsDetail();
    super.initState();
  }

  Widget _buildTitle(BuildContext context, MainModel model) {
    Map<String, dynamic> title =
        model.newsdetail == null ? null : model.newsdetail.title;
    if (title == null) {
      return new Container();
    }
    List<Widget> list = new List();
    title.forEach((String key, dynamic value) {
      if (key.contains("content")) {
        list.add(new Text(
          value,
          style: new TextStyle(fontSize: 20.0),
        ));
      } else {
        list.add(new RW(key, value));
      }
    });
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: list,
      ),
    );
  }

  Widget _buildArticle(BuildContext context, MainModel model) {
    List<dynamic> articleList = model.newsdetail == null ? null : model.newsdetail.Content;

    if (articleList == null) {
      return new Container();
    }
    List<Widget> list = new List();

    articleList.forEach((dynamic article) {
      if(article.length == 0){
        return;
      }
      List<Widget> eacharticle = new List();
      
      eacharticle.add(SizedBox(width: 50.0,));
      
      article.forEach((String key, dynamic value) {
        if (key.contains("content")) {
          for(int i =0; i< value.length;i++){
            var char = value[i];
            eacharticle.add(new RW("", char));
          }
        } else {
          eacharticle.add(new RW(key, value));
        }
      });
      eacharticle.add(SizedBox(height: 80.0,));
      list.add(new Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: eacharticle,
      ));

    });

    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(5.0),
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 10.0),
        child: new Column(
          children: <Widget>[
            new Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: list,
            ),
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("News")),
        body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            Widget content = new Container(
              alignment: Alignment.topCenter,
              child: new SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    _buildTitle(context, model),
                    SizedBox(
                      width: 20.0,
                      height: 20.0,
                    ),
                    _buildArticle(context, model),
                  ],
                ),
              ),
            );
            print(model.isLoading);
            if (model.isLoading) {
              content = Center(child: CircularProgressIndicator());
            }
            return content;
          },
        )
    );
  }
}
