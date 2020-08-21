import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class LeopardImage extends StatelessWidget {
  const LeopardImage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerticalCubit, double>(
      builder: (context, verticalPosition) {
        return BlocBuilder<HorizontalCubit, Parameter>(
          builder: (context, pageViewParameter) {
            return BlocBuilder<OnMapTransitionCubit, bool>(
              builder: (context, showMap) {
                double _percent = verticalPosition / (size.height * 0.6);
                double _scale = 1 - ((1 - 0.9) * _percent);
                double _sigma = _percent * 1.5;
                return Positioned(
                  top: size.height * 0.3,
                  left: -pageViewParameter.horizontalPosition * 0.85,
                  height: size.height * 0.4,
                  child: IgnorePointer(
                    child: Transform.scale(
                      scale: _scale,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: (showMap) ? 0.0 : 1.0,
                        child: Container(
                          width: size.width * 1.5,
                          height: size.height,
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                                sigmaX: _sigma, sigmaY: _sigma),
                            child: Image.asset(
                              'assets/images/leopard.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
