import 'package:flutter/material.dart';
import 'package:nhkeasynews/store/main.dart';
import 'package:nhkeasynews/utility/ui_element/NewsCard.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  /* Prodution Modal*/
  /*final MainModel model;
  HomePage(this.model);*/
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    /* Prodution Modal*/
    /*widget.model.startGetAllNewsList();*/
    super.initState();
  }

  /* Build the Home page with Custom Scroll View*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          Appbar(),
          BodyGrid()
        ],
      ),
    );
  }

  /* Home Page App Bar */
  Widget Appbar() => SliverAppBar(
        backgroundColor: Color.fromRGBO(255, 250, 250, 0.8),
        pinned: true,
        elevation: 0.2,
        forceElevated: true,
        expandedHeight: 100.0,
//    flexibleSpace: FlexibleSpaceBar(
//      centerTitle:false,
//
//    ),
      );

  /* Home Page Body Scroll View */
  Widget BodyGrid() => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.0,
        ),
      delegate: SliverChildBuilderDelegate((BuildContext context,int index){
        return NewsCard(index);
      },childCount: 20),
  );


/*@override
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
  }*/
}
