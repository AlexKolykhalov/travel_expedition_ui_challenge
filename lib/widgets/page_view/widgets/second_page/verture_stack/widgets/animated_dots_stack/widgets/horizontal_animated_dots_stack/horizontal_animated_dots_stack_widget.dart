import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/horizontal_animated_dots_stack/widgets/animated_dot_widget.dart';

class HorizontalAnimatedDotsStack extends StatelessWidget {
  const HorizontalAnimatedDotsStack({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    double _bottomBigDots = size.height * 0.16;
    double _bottomSmallDots = (size.height * 0.16) + (size.height * 0.016 / 8);
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        return BlocBuilder<VerticalCubit, double>(
          builder: (context, verticalPosition) {
            Duration _duration = (verticalPosition > 0.0)
                ? Duration(milliseconds: 150)
                : Duration(milliseconds: 600);
            return Stack(
              children: [
                AnimatedDot(
                  size: size.height * 0.015,
                  bottom: _bottomBigDots,
                  duration: _duration,
                  horizontalPosition:
                      (pageViewParameter.page > 0.9 && verticalPosition == 0.0)
                          ? 30.0
                          : 0.0,
                  isLeft: true,
                  opacity: (pageViewParameter.page > 1)
                      ? 0.0
                      : pageViewParameter.page,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                ),
                AnimatedDot(
                  size: size.height * 0.01,
                  bottom: _bottomSmallDots,
                  duration: _duration,
                  horizontalPosition:
                      (pageViewParameter.page > 0.9 && verticalPosition == 0.0)
                          ? 10.0
                          : 0.0,
                  isLeft: true,
                  opacity: (pageViewParameter.page > 1)
                      ? 0.0
                      : pageViewParameter.page,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                AnimatedDot(
                  size: size.height * 0.01,
                  bottom: _bottomSmallDots,
                  duration: _duration,
                  horizontalPosition:
                      (pageViewParameter.page > 0.9 && verticalPosition == 0.0)
                          ? 10.0
                          : 0.0,
                  isLeft: false,
                  opacity: (pageViewParameter.page > 1)
                      ? 0.0
                      : pageViewParameter.page,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
                AnimatedDot(
                  size: size.height * 0.015,
                  bottom: _bottomBigDots,
                  duration: _duration,
                  horizontalPosition:
                      (pageViewParameter.page > 0.9 && verticalPosition == 0.0)
                          ? 30.0
                          : 0.0,
                  isLeft: false,
                  opacity: (pageViewParameter.page > 1)
                      ? 0.0
                      : pageViewParameter.page,
                  decoration: (verticalPosition > 0)
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                        )
                      : BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
