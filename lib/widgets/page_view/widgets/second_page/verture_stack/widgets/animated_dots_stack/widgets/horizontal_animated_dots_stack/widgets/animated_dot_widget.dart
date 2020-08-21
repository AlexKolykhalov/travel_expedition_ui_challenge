import 'package:flutter/material.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    Key key,
    @required this.size,
    @required this.bottom,
    @required this.horizontalPosition,
    @required this.opacity,
    @required this.duration,
    @required this.decoration,
    @required this.isLeft,
  }) : super(key: key);

  final double size;
  final double bottom;
  final double horizontalPosition;
  final double opacity;
  final Duration duration;
  final BoxDecoration decoration;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      bottom: bottom,
      left: (isLeft) ? 0.0 : horizontalPosition,
      right: (isLeft) ? horizontalPosition : 0.0,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: size,
          height: size,
          decoration: decoration,
        ),
      ),
    );
  }
}
