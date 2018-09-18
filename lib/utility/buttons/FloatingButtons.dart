import "dart:math" as math;

import 'package:flutter/material.dart';

class FloatingButtons extends StatefulWidget {
  @override
  State createState() {
    return _FloatingButtons();
  }
}

class _FloatingButtons extends State<FloatingButtons>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: ScaleTransition(
            scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 1.0, curve: Curves.easeOut)),
            child: FloatingActionButton(
              elevation: 0.0,
              mini: true,
              heroTag: "comment",
              onPressed: () {},
              child: Icon(Icons.comment, color: Colors.white),
            ),
          ),
        ),
        Container(
          child: ScaleTransition(
            scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 0.7, curve: Curves.easeOut)),
            child: FloatingActionButton(
              elevation: 0.0,
              mini: true,
              heroTag: "saved",
              onPressed: () {},
              child: Icon(Icons.favorite, color: Colors.white),
            ),
          ),

        ),
        Container(
          child: ScaleTransition(
            scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 0.4, curve: Curves.easeOut)),
            child: FloatingActionButton(
              elevation: 0.0,
              mini: true,
              heroTag: "back",
              onPressed: () {},
              child: Icon(Icons.arrow_left, color: Colors.white),
            ),
          ),
        ),
        FloatingActionButton(
            elevation: 5.0,
            mini: true,
            heroTag: "more",

            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationZ(_controller.value *0.5  * math.pi),
                    child: Icon(_controller.isDismissed?Icons.more_horiz:Icons.close,color: Colors.white),
                  );
                })
        ),
      ],
    );
  }
}
