import 'package:flutter/material.dart';
import 'package:nhkeasynews/models/NewsList.dart';
import 'package:nhkeasynews/store/main.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsCard extends StatelessWidget {

  int selectItemCardIndex;

  NewsCard(this.selectItemCardIndex);

  Widget _buildNewsCardStack(BuildContext context){
    return InkWell(
      splashColor: Colors.orange,
      borderRadius: BorderRadius.circular(10.0),
      child:Card(
        elevation: 5.0,
        child: Stack(
          children: <Widget>[
            NewsCardImage(),
            NewsCardColor(),
            NewsTitle(),
          ],
        ),
      )
    );
  }

  /* Set up News Image Card Image*/
  Widget NewsCardImage()=> AspectRatio(
    aspectRatio: 1.0,
    child: Container(
      child: Image(image: NetworkImage("https://d9np3dj86nsu2.cloudfront.net/image/f38d045d55e0b043c8a84d02fb7069a5"),fit: BoxFit.cover)
    )
  );

  /* Set up News Image Card Color */
  Widget NewsCardColor() => new Container(
    decoration: BoxDecoration(boxShadow:[
      BoxShadow(
          color: Colors.white.withAlpha(500),
      ),
    ]),
  );

  /* Set up News Title */
  Widget NewsTitle() => Container(
    alignment: Alignment.bottomLeft,
    child: new Text("This is a title",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w100),),
  );



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
            onPressed: () => Navigator.pushNamed(
                context, "/home/" + selectItemCardIndex.toString()),
          )
        ],
      ),
    );
  }

  /* Product Version */
  /*@override
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
                */ /*Expanded(
                  child: new Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildItemInfo(context),
                  ),
                ),*/ /*
              ],
            );
          }),
    );
  }*/

  /* Developer Version */

  @override
  Widget build(BuildContext context) {
    return _buildNewsCardStack(context);
  }
}
