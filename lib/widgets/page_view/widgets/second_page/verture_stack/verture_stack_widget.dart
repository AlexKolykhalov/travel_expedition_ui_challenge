import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/animated_dots_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/travel_details_basecamp_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/travel_details_start_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/travel_details_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/vulture_circle_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/vulture_image_widget.dart';

class VertureStack extends StatelessWidget {
  const VertureStack({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnMapTransitionCubit, bool>(
      builder: (context, showMap) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: showMap ? 0.0 : 1.0,
          child: Stack(
            //because VultureImage is Positioned
            children: [
              VultureCircle(size: size),
              VultureImage(size: size),
              TravelDetails(size: size),
              TravelDetailsStart(size: size),
              TravelDetailsBaseCamp(size: size),
              AnimatedDotsStack(size: size),
            ],
          ),
        );
      },
    );
  }
}
