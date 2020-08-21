import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnMapTransitionCubit, bool>(
      builder: (context, showMap) {
        return Positioned(
          top: size.height * 0.05,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'SY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.025,
                  ),
                ),
                AnimatedCrossFade(
                  duration: Duration(seconds: 1),
                  secondCurve: Curves.easeInExpo,
                  crossFadeState: showMap
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: Icon(Icons.menu),
                  secondChild: GestureDetector(
                    onTap: () {
                      context
                          .bloc<OnMapTransitionCubit>()
                          .onMapTransition(showMap: false);
                    },
                    child: Text(
                      'BACK',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.025,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
