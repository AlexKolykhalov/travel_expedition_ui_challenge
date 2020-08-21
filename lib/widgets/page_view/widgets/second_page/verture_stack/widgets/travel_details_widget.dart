import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class TravelDetails extends StatelessWidget {
  const TravelDetails({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        return BlocBuilder<VerticalCubit, double>(
          builder: (context, verticalPosition) {
            return Positioned(
              bottom: verticalPosition,
              left: -pageViewParameter.horizontalPosition + size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                width: size.width,
                height: size.height * 0.25,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.03),
                    child: Opacity(
                      opacity: (pageViewParameter.page > 1)
                          ? 0.0
                          : pageViewParameter.page,
                      child: Text('Travel details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.035)),
                    ),
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
