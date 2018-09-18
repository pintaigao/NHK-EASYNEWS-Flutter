
import 'package:flutter/material.dart';
import 'package:nhkeasynews/utility/buttons/FloatingButtons.dart';

class NewsDetailPage extends StatelessWidget {
  int currentItemDetailIndex;

  NewsDetailPage(this.currentItemDetailIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        elevation: 0.3,
        title: Text("Product"),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),*/
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 256.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: currentItemDetailIndex,
                child: new Container(),
//                    child: FadeInImage(placeholder: null, image: null)
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                  child: new Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.favorite_border, color: Colors.grey),
                          Icon(Icons.comment, color: Colors.grey),
                          Icon(Icons.remove_red_eye, color: Colors.grey)
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: null,
                        ),
                        title: Text("Name of the item"),
                        subtitle: Text("Auther"),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
                          child: Text("Item description,")

                      )

                    ],
                  )
              )
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingButtons(),
    );
  }
}
