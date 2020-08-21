import 'package:flutter/material.dart';

class VerticalLineDot extends StatelessWidget {
  const VerticalLineDot({
    Key key,
    @required this.size,
    @required this.verticalPosition,
    @required this.left,
    @required this.right,
    @required this.bottom,
    @required this.opacity,
    @required this.isMoving,
    @required this.decoration,
  }) : super(key: key);

  final Size size;
  final double verticalPosition;
  final double left;
  final double right;
  final double bottom;
  final double opacity;
  final bool isMoving;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      bottom: (isMoving) ? bottom + verticalPosition : bottom,
      child: Center(
        child: Opacity(
          opacity: opacity,
          child: Container(
              height: size.height * 0.015,
              width: size.height * 0.015,
              decoration: decoration),
        ),
      ),
    );
  }
}
