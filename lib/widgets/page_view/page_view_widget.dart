import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/first_page/first_page_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/second_page_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/third_page/third_page_widget.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController()..addListener(_getCoordinates);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _getCoordinates() {
    context.bloc<HorizontalCubit>().setParameter(
            parameter: Parameter(
          horizontalPosition: _pageController.offset,
          page: _pageController.page,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      key: Key('pageview'),
      controller: _pageController,
      onPageChanged: (value) {
        if (value != 1) {
          context.bloc<OnMapTransitionCubit>().onMapTransition(showMap: false);
          context
              .bloc<VerticalCubit>()
              .setVerticalPosition(currentVerticalPosition: 0.0);
        }
      },
      children: [
        FirstPage(size: widget.size),
        SecondPage(size: widget.size),
        ThirdPage()
      ],
    );
  }
}
