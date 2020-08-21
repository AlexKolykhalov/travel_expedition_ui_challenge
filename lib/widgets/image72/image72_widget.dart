import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class Image72 extends StatelessWidget {
  const Image72({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        return Positioned(
          top: size.height * 0.15,
          left: -pageViewParameter.horizontalPosition - size.width * 0.19,
          child: Container(
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                '72',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: size.height * 0.5),
              ),
            ),
          ),
        );
      },
    );
  }
}
