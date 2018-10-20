import 'package:flutter/material.dart';

class RW extends StatelessWidget {

  String ruby;
  String word;
  double rubySize;
  double wordSize;
  Color wordColor;
  FontWeight fontWeight;
  RW(this.ruby, this.word,{this.rubySize = 10.0,this.wordSize = 20.0,this.wordColor = Colors.black, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(ruby,style:new TextStyle(fontSize: rubySize,color: Colors.blue, fontWeight: fontWeight)),
          new Text(word,style:new TextStyle(fontSize: wordSize,color: wordColor, fontWeight: fontWeight)),
        ],
      ),
    );
  }
}
