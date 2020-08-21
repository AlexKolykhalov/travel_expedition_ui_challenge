import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    Key key,
    @required this.bottom,
    @required this.verticalPosition,
  }) : super(key: key);

  final double bottom;
  final double verticalPosition;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: bottom,
      child: Center(
        child: Container(
          height: verticalPosition,
          width: 3.0,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
