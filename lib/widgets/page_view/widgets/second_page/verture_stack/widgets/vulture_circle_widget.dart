import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class VultureCircle extends StatelessWidget {
  const VultureCircle({
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
            double _width =
                (pageViewParameter.page == 1.0) ? size.height * 0.25 : 0.0;
            double _height =
                (pageViewParameter.page == 1.0) ? size.height * 0.25 : 0.0;
            Duration _duration = (pageViewParameter.page == 1.0)
                ? Duration(milliseconds: 300)
                : Duration(milliseconds: 50);

            if (verticalPosition > 0.0) {
              _width = 0.0;
              _height = 0.0;
              _duration = Duration(milliseconds: 100);
            }
            return Center(
              child: AnimatedContainer(
                margin: EdgeInsets.only(bottom: size.height * 0.25),
                width: _width,
                height: _height,
                duration: _duration,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
