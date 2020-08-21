//simport 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class RotatedArrowIcon extends StatelessWidget {
  const RotatedArrowIcon({
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
            return BlocBuilder<OnMapTransitionCubit, bool>(
              builder: (context, showMap) {
                return Positioned(
                  bottom: verticalPosition,
                  right: pageViewParameter.horizontalPosition / size.width,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02,
                        vertical: size.height * 0.02),
                    height: size.height * 0.25,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: showMap ? 0.0 : 1.0,
                        child: RotatedBox(
                            quarterTurns:
                                (verticalPosition > size.height * 0.1) ? 3 : 1,
                            child: Icon(Icons.arrow_back_ios)),
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
