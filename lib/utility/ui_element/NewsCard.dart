import 'package:flutter/material.dart';
import 'package:nhkeasynews/Pages/NewsDetailPage/NewsDetailPage.dart';
import 'package:nhkeasynews/store/main.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsCard extends StatelessWidget {
  int selectItemCardIndex;

  NewsCard(this.selectItemCardIndex);

  var img;

  Widget _buildItemInfo(BuildContext context, String title) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
      child:Text(
        title,
        style: new TextStyle(
            fontSize: 13.0, fontWeight: FontWeight.w900, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
      /*  String url = model.allNewsList[selectItemCardIndex].news_web_img_uri ==
                null
            ? "https://www3.nhk.or.jp/news/easy/images/banner_newsweb_pc.png"
            : model.allNewsList[selectItemCardIndex].news_web_img_uri;
            img = NetworkImage(url);*/

        var title = model.allNewsList[selectItemCardIndex].title;

        return Stack(
          children: <Widget>[
            new Container(
//                  child: new FadeInImage(placeholder: Image.network("https://www3.nhk.or.jp/news/easy/images/banner_newsweb_pc.png",fit: BoxFit.scaleDown,).image, image: img ,fit: BoxFit.cover,height: screen.width/2 - 10.0, ),
                ),
            new Container(
              decoration: new BoxDecoration(color: Colors.black45),
            ),

            _buildItemInfo(context, title),

            new InkWell(
              radius: 20.0,
              onTap: () {
                Navigator.of(context).pushNamed("/home/"+selectItemCardIndex.toString());
              },
            ),
          ],
        );
      }),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
    );
  }
}
