import 'package:flutter/material.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/horizontal_animated_dots_stack/horizontal_animated_dots_stack_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/text72km_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/vertical_line_stack/vertical_line_stack_widget.dart';

class AnimatedDotsStack extends StatelessWidget {
  const AnimatedDotsStack({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VerticalLineStack(size: size),
        HorizontalAnimatedDotsStack(size: size),
        Text72km(size: size),
      ],
    );
  }
}
