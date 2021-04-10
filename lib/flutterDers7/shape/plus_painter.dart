import 'package:flutter/material.dart';

class PlusPainter extends CustomPainter {
  Paint _paint;
  double _fraction;

  PlusPainter(this._fraction) {
    _paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 25.0
      ..strokeCap = StrokeCap.round;
  }

  void paint(Canvas canvas, Size size) {
    double leftLineFraction, rightLineFraction;

    if (_fraction < .5) {
      leftLineFraction = _fraction / .5;
      rightLineFraction = 0.0;
    } else {
      leftLineFraction = 1.0;
      rightLineFraction = (_fraction - .5) / .5;
    }

    canvas.drawLine(
        Offset(size.width/2, 0),
        Offset(size.width/2, size.height * leftLineFraction),
        _paint);



    if (_fraction >= .5) {
      canvas.drawLine(
          Offset(0, size.height/2 ),
          Offset(size.width * rightLineFraction , size.height/2),
          _paint);
    }
  }

  @override
  bool shouldRepaint(PlusPainter oldDelegate) {
    return oldDelegate._fraction != _fraction;
  }
}
