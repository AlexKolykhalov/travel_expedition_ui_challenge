import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/vertical_line_stack/widgets/dot_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/vertical_line_stack/widgets/label_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/vertical_line_stack/widgets/vertical_line_widget.dart';

class VerticalLineStack extends StatelessWidget {
  const VerticalLineStack({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    double _bottom = (size.height * 0.16) + (size.height * 0.016 / 8);
    return BlocBuilder<VerticalCubit, double>(
      builder: (context, verticalPosition) {
        return Stack(
          children: [
            VerticalLine(
              bottom: _bottom,
              verticalPosition: verticalPosition,
            ),
            VerticalLineDot(
              size: size,
              verticalPosition: verticalPosition,
              left: 0.0,
              right: 0.0,
              bottom: _bottom,
              opacity: (verticalPosition == 0.0) ? 0.0 : 1.0,
              isMoving: true,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
            VerticalLineDot(
              size: size,
              verticalPosition: verticalPosition,
              left: 0.0,
              right: 0.0,
              bottom: _bottom + size.height * 0.2,
              opacity: (verticalPosition < size.height * 0.2) ? 0.0 : 1.0,
              isMoving: false,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
            ),
            VerticalLineDot(
              size: size,
              verticalPosition: verticalPosition,
              left: 0.0,
              right: 0.0,
              bottom: _bottom + size.height * 0.4,
              opacity: (verticalPosition < size.height * 0.4) ? 0.0 : 1.0,
              isMoving: false,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
            ),
            VerticalLineAnimalLabel(
              horizontalPosition: (verticalPosition < size.height * 0.4)
                  ? size.width * 0.15
                  : size.width * 0.2,
              opacity: (verticalPosition < size.height * 0.4) ? 0.0 : 1.0,
              size: size,
              type: 'V',
            ),
            VerticalLineAnimalLabel(
              horizontalPosition: (verticalPosition < size.height * 0.4)
                  ? size.width * 0.15
                  : size.width * 0.2,
              opacity: (verticalPosition < size.height * 0.4) ? 0.0 : 1.0,
              size: size,
              type: 'L',
            ),
          ],
        );
      },
    );
  }
}
