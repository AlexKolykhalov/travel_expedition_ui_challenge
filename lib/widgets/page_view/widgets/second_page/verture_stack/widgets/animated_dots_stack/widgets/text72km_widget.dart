import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/models.dart';

class Text72km extends StatelessWidget {
  const Text72km({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalCubit, Parameter>(
      builder: (context, pageViewParameter) {
        return Positioned(
          bottom: size.height * 0.115,
          child: Opacity(
              opacity:
                  (pageViewParameter.page > 1) ? 0.0 : pageViewParameter.page,
              child: Container(
                width: size.width,
                child: Center(
                  child: Text('72 km.',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              )),
        );
      },
    );
  }
}
