import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Test extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TestState();
  }

}

class TestState extends State<Test>{

  var imageEncode;

  @override
  Widget build(BuildContext context) {

    Future<dynamic> _getImage () {
      return http.get("http://localhost:8080/api/news").then((http.Response response) {
        List<dynamic> newslistData = json.decode(response.body);
        if (newslistData == null) {
          return;
        }
        if(imageEncode == null){
          imageEncode = null;
        }else{
          imageEncode = newslistData[0]["news_img"];
        }

      }).catchError((error){
        print(error);
        return;
      });
    }

    _getImage();

    return new Container(
      decoration: BoxDecoration(color: Colors.white),
      child: new Container(
        child: imageEncode == null?null:new Image.memory(Base64Codec().decode(imageEncode)),
      ),
    );
  }

}
