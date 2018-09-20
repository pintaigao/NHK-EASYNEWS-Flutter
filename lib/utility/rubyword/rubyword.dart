import 'package:flutter/material.dart';

class RW extends StatelessWidget {

  String ruby;
  String word;
  RW(this.ruby, this.word);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(ruby,style:new TextStyle(fontSize: 10.0,color: Colors.blue)),
          new Text(word,style:new TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }
}
