import 'package:flutter/material.dart';

class CurveLinePainter extends CustomPainter {
  CurveLinePainter({
    this.size,
    this.tweenAnimationValue,
  });

  final Size size;
  final double tweenAnimationValue;

  @override
  void paint(Canvas canvas, Size size) {
    Offset point1, point2, point3, point4;
    Offset controlPoint11,
        controlPoint12,
        controlPoint21,
        controlPoint22,
        controlPoint31,
        controlPoint32;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 2;

    //  0.0 ------------> x
    //    |
    //  y |    point1
    //    |
    //    |    point2
    //    |
    //    |    point3
    //    |
    //    |    point4
    //    |
    //    V

    point1 = Offset(
        (size.width / 2) + ((size.width * 0.1) * tweenAnimationValue),
        (size.height * 0.2) + ((size.height * 0.03) * tweenAnimationValue));

    controlPoint11 = Offset(
        point1.dx + (size.width * 0.05) * tweenAnimationValue,
        point1.dy + (size.height * 0.1) * tweenAnimationValue);
    controlPoint12 = Offset(
        point1.dx - (size.width * 0.05) * tweenAnimationValue,
        point1.dy + (size.height * 0.1) * tweenAnimationValue);

    point2 = Offset(
        (size.width / 2) + ((size.width * 0.2) * tweenAnimationValue),
        size.height * 0.4);

    controlPoint21 = Offset(
        point2.dx - (size.width * 0.05) * tweenAnimationValue,
        point2.dy + (size.height * 0.1) * tweenAnimationValue);
    controlPoint22 = Offset(
        point2.dx + (size.width * 0.05) * tweenAnimationValue,
        point2.dy + (size.height * 0.2) * tweenAnimationValue);

    point3 = Offset(
        (size.width / 2) + ((size.width * 0.12) * tweenAnimationValue),
        size.height * 0.6 + ((size.height * 0.05) * tweenAnimationValue));

    controlPoint31 = Offset(
        point3.dx + (size.width * 0.05) * tweenAnimationValue,
        point3.dy + (size.height * 0.2) * tweenAnimationValue);
    controlPoint32 = Offset(
        point3.dx - (size.width * 0.4) * tweenAnimationValue,
        point3.dy - tweenAnimationValue);

    point4 = Offset(
        (size.width / 2) - ((size.width * 0.13) * tweenAnimationValue),
        size.height * 0.8 + ((size.height * 0.045) * tweenAnimationValue));

    Path path = Path()
      ..moveTo(point1.dx, point1.dy)
      ..cubicTo(
        controlPoint11.dx,
        controlPoint11.dy,
        controlPoint12.dx,
        controlPoint12.dy,
        point2.dx,
        point2.dy,
      )
      ..cubicTo(
        controlPoint21.dx,
        controlPoint21.dy,
        controlPoint22.dx,
        controlPoint22.dy,
        point3.dx,
        point3.dy,
      )
      ..cubicTo(
        controlPoint31.dx,
        controlPoint31.dy,
        controlPoint32.dx,
        controlPoint32.dy,
        point4.dx,
        point4.dy,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
