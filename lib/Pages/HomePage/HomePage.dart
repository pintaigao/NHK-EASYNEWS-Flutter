import 'package:flutter/material.dart';
import 'package:nhkeasynews/store/main.dart';
import 'package:nhkeasynews/utility/ui_element/NewsCard.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  HomePage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.model.startGetAllNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
          Widget content = GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 0.2,
            children: List.generate(model.allNewsList.length, (int index){
               return new Container(
                 child: NewsCard(index),
               );
            }),
          );
          if (model.isLoading){
            content = Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(child: content, onRefresh: model.startGetAllNewsList, );
        },
      ),
    );
  }
}
