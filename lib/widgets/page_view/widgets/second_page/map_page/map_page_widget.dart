import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/map_animation/map_animation_cubit.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/map_page/widgets/curveline_painter.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/second_page/verture_stack/widgets/animated_dots_stack/widgets/vertical_line_stack/widgets/dot_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _mapAnimController;

  @override
  void initState() {
    super.initState();
    _mapAnimController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_mapAnimController)
      ..addListener(() {
        _setTweenAnimation();
      });
  }

  void _setTweenAnimation() {
    context.bloc<MapAnimationCubit>().setTweenAnimation(val: _animation.value);
  }

  @override
  void dispose() {
    _mapAnimController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _bottom =
        (widget.size.height * 0.16) + (widget.size.height * 0.016 / 8);

    return BlocBuilder<OnMapTransitionCubit, bool>(
      builder: (context, showMap) {
        return BlocBuilder<MapAnimationCubit, double>(
          builder: (context, tweenAnimationValue) {
            (showMap)
                ? _mapAnimController.forward()
                : _mapAnimController.reverse();
            return AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: (showMap) ? 1.0 : 0.0,
              child: IgnorePointer(
                child: Container(
                  width: widget.size.width,
                  height: widget.size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/map.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: AnimatedBuilder(
                    animation: _animation,
                    child: Stack(
                      children: <Widget>[
                        VerticalLineDot(
                          size: widget.size,
                          verticalPosition: 0.0,
                          left: tweenAnimationValue * widget.size.width * 0.2,
                          right: 0.0,
                          bottom: (_bottom + widget.size.height * 0.6) -
                              tweenAnimationValue * widget.size.width * 0.05,
                          opacity: 1.0,
                          isMoving: false,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                        VerticalLineDot(
                          size: widget.size,
                          verticalPosition: 0.0,
                          left: tweenAnimationValue * widget.size.width * 0.4,
                          right: 0.0,
                          bottom: (_bottom + widget.size.height * 0.4) +
                              tweenAnimationValue * widget.size.width * 0.01,
                          opacity: 1.0,
                          isMoving: false,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        VerticalLineDot(
                          size: widget.size,
                          verticalPosition: 0.0,
                          left: tweenAnimationValue * widget.size.width * 0.25,
                          right: 0.0,
                          bottom: (_bottom + widget.size.height * 0.2) -
                              tweenAnimationValue * widget.size.width * 0.05,
                          opacity: 1.0,
                          isMoving: false,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        VerticalLineDot(
                          size: widget.size,
                          verticalPosition: 0.0,
                          left: -tweenAnimationValue * widget.size.width * 0.25,
                          right: 0.0,
                          bottom: _bottom -
                              tweenAnimationValue * widget.size.width * 0.03,
                          opacity: 1.0,
                          isMoving: false,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        Positioned(
                            left: widget.size.width / 2 -
                                widget.size.width * 0.35,
                            bottom: _bottom -
                                tweenAnimationValue *
                                    widget.size.height *
                                    0.025,
                            child: Text(
                              'Start camp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Positioned(
                            right: widget.size.width / 2 -
                                widget.size.width * 0.35,
                            bottom: (_bottom + widget.size.height * 0.6) -
                                (widget.size.height *
                                    0.03 *
                                    tweenAnimationValue),
                            child: Text(
                              'Base camp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Positioned(
                            left: (widget.size.width * 0.25) +
                                (widget.size.width * 0.5 * tweenAnimationValue),
                            top: widget.size.height * 0.33 +
                                (widget.size.height *
                                    0.02 *
                                    tweenAnimationValue),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: widget.size.width * 0.1,
                                    height: widget.size.height * 0.05,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/leopards.png'),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Leopards',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                        Positioned(
                            left: widget.size.width * 0.65 -
                                (widget.size.width *
                                    0.23 *
                                    tweenAnimationValue),
                            top: widget.size.height * 0.53 +
                                (widget.size.height *
                                    0.05 *
                                    tweenAnimationValue),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: widget.size.width * 0.1,
                                    height: widget.size.height * 0.05,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/vultures.png'),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Vultures',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                    builder: (context, child) {
                      return CustomPaint(
                        painter: CurveLinePainter(
                          size: widget.size,
                          tweenAnimationValue: tweenAnimationValue,
                        ),
                        child: child,
                      );
                    },
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
