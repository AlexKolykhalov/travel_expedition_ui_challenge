import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/map_page/map_page_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/verture_stack_widget.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerticalCubit, double>(
      builder: (context, verticalPosition) {
        return Stack(
          children: <Widget>[
            //TODO try to compose this construction with GestureDet & VertureStackImageCircle
            GestureDetector(
              onVerticalDragUpdate: (details) {
                context.bloc<VerticalCubit>().setVerticalPosition(
                    currentVerticalPosition: math.min(size.height * 0.6,
                        verticalPosition - details.primaryDelta * 15.0));
              },
              child: VertureStack(size: size),
            ),
            MapPage(size: size),
          ],
        );
      },
    );
  }
}
