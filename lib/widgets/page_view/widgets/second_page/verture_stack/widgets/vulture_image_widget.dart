import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class VultureImage extends StatelessWidget {
  const VultureImage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        return BlocBuilder<VerticalCubit, double>(
          builder: (context, verticalPosition) {
            double _percent = verticalPosition / (size.height * 0.6);
            double _scale = 1 - ((1 - 0.8) * _percent);
            double _sigma = _percent * 1.5;
            return Positioned(
              top: size.height * 0.3,
              left: size.width -
                  pageViewParameter.horizontalPosition +
                  size.width * 0.35,
              child: Transform.scale(
                scale: _scale,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: _sigma, sigmaY: _sigma),
                  child: Image.asset(
                    'assets/images/vulture.png',
                    height: size.height * 0.4,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
