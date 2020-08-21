import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/animation_button/animation_button_cubit.dart';
import 'package:some_animation_ex12/cubit/horizontal/horizontal_cubit.dart';
import 'package:some_animation_ex12/cubit/map_animation/map_animation_cubit.dart';
import 'package:some_animation_ex12/cubit/on_map_transition/on_map_transition_cubit.dart';
import 'package:some_animation_ex12/cubit/users/users_cubit.dart';
import 'package:some_animation_ex12/cubit/vertical/vertical_cubit.dart';
import 'package:some_animation_ex12/widgets/app_bar/app_bar_widget.dart';
import 'package:some_animation_ex12/widgets/bottom_nav_bar/botton_nav_bar_widget.dart';
import 'package:some_animation_ex12/widgets/image72/image72_widget.dart';
import 'package:some_animation_ex12/widgets/leopard_image/leopard_image_widget.dart';
import 'package:some_animation_ex12/widgets/page_view/page_view_widget.dart';
import 'package:some_animation_ex12/widgets/rotated_arrow_icon/rotated_arrow_icon_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AnimationButtonCubit(),
          ),
          BlocProvider(
            create: (context) => HorizontalCubit(),
          ),
          BlocProvider(
            create: (context) => OnMapTransitionCubit(),
          ),
          BlocProvider(
            create: (context) => GetUsersCubit(),
          ),
          BlocProvider(
            create: (context) => MapAnimationCubit(),
          ),
          BlocProvider(
            create: (context) =>
                // VerticalDragUpdateCubit(context.bloc<GetOffsetCubit>()),
                VerticalCubit(),
          ),
        ],
        child: FirstPage(),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image72(size: size),
            LeopardImage(size: size),
            RotatedArrowIcon(size: size),
            PageViewWidget(size: size),
            BottomNavBarWidget(size: size),
            AppBarWidget(size: size),
          ],
        ),
      ),
    );
  }
}
