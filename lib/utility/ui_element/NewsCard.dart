import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  int selectItemCardIndex;

  NewsCard(this.selectItemCardIndex);

  Widget _buildItemInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
//            crossAxisAlignment: CrossAxisAlignment.center,
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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
//          Hero( tag: selectItemCardIndex, ),
          Expanded(
            child: new Align(
              alignment: Alignment.bottomCenter,
              child: _buildItemInfo(context),
            ),
          )
        ],
      ),
    );
  }
}
