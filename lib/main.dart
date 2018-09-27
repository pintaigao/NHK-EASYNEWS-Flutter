import 'package:flutter/material.dart';
import 'package:nhkeasynews/Pages/HomePage/HomePage.dart';
import 'package:nhkeasynews/Pages/NewsDetailPage/NewsDetailPage.dart';
import 'package:nhkeasynews/Pages/Test.dart';
import "package:nhkeasynews/store/main.dart";
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();

    return ScopedModel<MainModel>(
        model: model,
        child: MaterialApp(
          title: 'NHK Easy News',
          theme: new ThemeData(
            primarySwatch: Colors.grey,
          ),

          home: HomePage(model),
          routes: {
            "/home": (BuildContext context) => HomePage(model),
          },
          onGenerateRoute: (RouteSettings settings) {

            final List<String> pathElements = settings.name.split("/");
            print(pathElements);
            if (pathElements[0] != "") {
              return null;
            }
            if (pathElements[1] == "home") {
              final int index = int.parse(pathElements[2]);
              model.startGetNewsDetail(index);
              return MaterialPageRoute(
                  builder: (BuildContext context) =>
                      NewsDetailsPage(index)
              );
            };
          },
        ));
  }
}
