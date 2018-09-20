//import 'package:flutter/material.dart';
//import 'package:nhkeasynews/models/NewsList.dart';
//import 'package:nhkeasynews/store/main.dart';
//import 'package:scoped_model/scoped_model.dart';
//
//class NewsCard extends StatelessWidget {
//  int selectItemCardIndex;
//
//  NewsCard(this.selectItemCardIndex);
//
//  Widget _buildItemInfo(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          new IconButton(
//            icon: Icon(Icons.favorite),
//            color: Colors.grey,
//          ),
//          new IconButton(
//            icon: Icon(Icons.comment),
//            color: Colors.grey,
//            onPressed: () => Navigator.pushNamed(
//                context, "/home/" + selectItemCardIndex.toString()),
//          )
//        ],
//      ),
//    );
//  }
//
//  /* Product Version */
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      elevation: 5.0,
//      child: ScopedModelDescendant<MainModel>(
//          builder: (BuildContext context, Widget child, MainModel model) {
//            String url = model.allNewsList[selectItemCardIndex].news_web_img_uri == null ? "https://www3.nhk.or.jp/news/easy/images/banner_newsweb_pc.png" : model.allNewsList[selectItemCardIndex].news_web_img_uri;
//            NetworkImage img = null;
//            try {
//              img = new NetworkImage(url);
//            } catch (error) {
//              img = new NetworkImage( "https://www3.nhk.or.jp/news/easy/images/banner_newsweb_pc.png");
//            }
//            return Stack(
//              children: <Widget>[
//                new Container(
//                  decoration: new BoxDecoration(image: DecorationImage(image: img,fit: BoxFit.cover),borderRadius:BorderRadius.circular(5.0)),
//                ),
//                 Expanded(
//                  child: new Align(
//                    alignment: Alignment.bottomCenter,
//                    child: _buildItemInfo(context),
//                  ),
//                ),
//              ],
//            );
//          }),
//    );
//  }
//
//  /* Product Version */
//  /*@override
//  Widget build(BuildContext context) {
//    return Card(
//      elevation: 5.0,
//      child: ScopedModelDescendant<MainModel>(
//          builder: (BuildContext context, Widget child, MainModel model) {
//        return Stack(
//          children: <Widget>[
//            new Container(
//              decoration: new BoxDecoration(
//                  borderRadius: BorderRadius.circular(5.0)),
//            ),
//          ],
//        );
//      }),
//    );
//  }*/
//}









import 'package:flutter/material.dart';
import 'package:nhkeasynews/store/main.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsCard extends StatelessWidget {
  int selectItemCardIndex;

  NewsCard(this.selectItemCardIndex);

  Widget _buildItemInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.grey,
          ),
          new IconButton(
            icon: Icon(Icons.comment),
            color: Colors.grey,
            onPressed: () =>
                Navigator.pushNamed(
                    context, "/home/" + selectItemCardIndex.toString()),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            String url = model.allNewsList[selectItemCardIndex].news_web_img_uri == null ? "https://www3.nhk.or.jp/news/easy/images/banner_newsweb_pc.png" : model.allNewsList[selectItemCardIndex].news_web_img_uri;
            NetworkImage img = null;
            try {
              img = new NetworkImage(url);
            } catch (error) {
              img = new NetworkImage( "https://www3.nhk.or.jp/news/easy/images/banner_newsweb_pc.png");
            }
            return Stack(
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(image: DecorationImage(image: img,fit: BoxFit.cover),borderRadius:BorderRadius.circular(5.0)),
                ),
                /*Expanded(
                  child: new Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildItemInfo(context),
                  ),
                ),*/
              ],
            );
          }),
    );
  }
}
