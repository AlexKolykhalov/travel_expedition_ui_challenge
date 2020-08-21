import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  static double _opacity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        _opacity =
            (pageViewParameter.page > 1) ? 0.0 : 1 - pageViewParameter.page;
        return Stack(
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              left: -pageViewParameter.horizontalPosition,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                width: size.width,
                height: size.height * 0.25,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  EdgeInsets.only(bottom: size.height * 0.03),
                              child: Opacity(
                                opacity: _opacity,
                                child: Text('Travel description',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.035)),
                              ),
                            ),
                            Opacity(
                              opacity: _opacity,
                              child: Text(
                                  'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.'),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
