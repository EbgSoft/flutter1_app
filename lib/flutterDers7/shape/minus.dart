import 'package:flutter/material.dart';
import 'package:flutter1_app/flutterDers7/shape/minus_painter.dart';

class Minus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MinusState();
}

class MinusState extends State<Minus>
    with SingleTickerProviderStateMixin {
  MinusPainter painter;
  Animation<double> animation;
  AnimationController controller;
  double fraction = 0.0;

  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          fraction = animation.value;
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    painter = MinusPainter(fraction);
    return CustomPaint(painter: painter);
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}


