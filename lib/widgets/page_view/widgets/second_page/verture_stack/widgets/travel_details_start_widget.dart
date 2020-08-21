import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class TravelDetailsStart extends StatelessWidget {
  const TravelDetailsStart({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;
//TODO refactoring same widgets with 'travel_details_basecamp_widget'
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          bottom: size.height * 0.1,
          left: (pageViewParameter.page > 0.9) ? 20.0 : 0.0,
          child: Container(
            width: size.width / 3,
            height: size.height * 0.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Opacity(
                  opacity: (pageViewParameter.page > 1)
                      ? 0.0
                      : pageViewParameter.page,
                  child: Text('Start camp',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.02)),
                ),
                Opacity(
                  opacity: (pageViewParameter.page > 1)
                      ? 0.0
                      : pageViewParameter.page,
                  child: Text('02:40 pm',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 0.015)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
