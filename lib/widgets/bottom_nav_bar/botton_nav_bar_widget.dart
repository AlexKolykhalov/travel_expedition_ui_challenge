import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  static Color _color1;
  static Color _color2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        return BlocBuilder<VerticalCubit, double>(
          builder: (context, verticalPosition) {
            return BlocBuilder<OnMapTransitionCubit, bool>(
              builder: (context, showMap) {
                if (pageViewParameter.page >= 0 &&
                    pageViewParameter.page <= 1) {
                  _color1 = Colors.black
                      .withOpacity(1 - (1.0 - 0.5) * pageViewParameter.page);
                  _color2 = Colors.black
                      .withOpacity(0.5 + (1.0 - 0.5) * pageViewParameter.page);
                } else {
                  _color1 = null;
                  _color2 = null;
                }

                return Positioned(
                  bottom: size.height * 0.05,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: size.width * 0.18,
                          child: AnimatedCrossFade(
                            duration: Duration(milliseconds: 2000),
                            secondCurve: Curves.easeInExpo,
                            crossFadeState: showMap
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            firstChild: AbsorbPointer(
                              absorbing: showMap,
                              child: GestureDetector(
                                onTap: () {
                                  if (verticalPosition == size.height * 0.6) {
                                    BlocProvider.of<OnMapTransitionCubit>(
                                            context)
                                        .onMapTransition(showMap: true);
                                  }
                                },
                                child: Opacity(
                                  opacity:
                                      (verticalPosition == size.height * 0.6)
                                          ? 1.0
                                          : 0.0,
                                  child: Text(
                                    'ON MAP',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            secondChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '24\'08\'293\'S',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.016,
                                  ),
                                ),
                                Text(
                                  '13\'50\'335\'E',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.016,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: showMap ? 0.0 : 1.0,
                          child: Container(
                            width: size.width * 0.1,
                            height: size.height * 0.01,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Dot(width: size.height * 0.01, color: _color1),
                                Dot(width: size.height * 0.01, color: _color2),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 0.15,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.share)),
                        )
                      ],
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

class Dot extends StatelessWidget {
  const Dot({
    Key key,
    @required this.width,
    @required this.color,
  }) : super(key: key);

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
