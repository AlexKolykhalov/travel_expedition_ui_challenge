import 'dart:math' as math;
import 'package:flutter/material.dart';

class SemiCirclePainter extends CustomPainter {
  SemiCirclePainter({this.isOnline});

  final bool isOnline;

  @override
  void paint(Canvas canvas, Size size) {
    final paintBlue = Paint()
      ..style = PaintingStyle.stroke
      ..color = (isOnline) ? Colors.blueAccent : Colors.transparent
      ..strokeWidth = 3.0;

    final paintBlack = Paint()
      ..style = PaintingStyle.stroke
      ..color = (isOnline) ? Colors.black : Colors.transparent
      ..strokeWidth = 2.0;

    final rect1 = Rect.fromLTRB(0, 0, size.width, size.height);
    final startAngle1 = -7 * math.pi / 4;
    final sweepAngle1 = -3 * math.pi / 2;
    final useCenter1 = false;

    final rect2 = Rect.fromLTRB(0, 0, size.width, size.height);
    final startAngle2 = -7 * math.pi / 4;
    final sweepAngle2 = math.pi / 2;
    final useCenter2 = false;

    canvas.drawArc(rect1, startAngle1, sweepAngle1, useCenter1, paintBlue);
    canvas.drawArc(rect2, startAngle2, sweepAngle2, useCenter2, paintBlack);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
