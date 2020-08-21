import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_animation_ex12/cubit/animation_button/animation_button_cubit.dart';
import 'package:some_animation_ex12/cubit/users/users_cubit.dart';
import 'package:some_animation_ex12/models.dart';
import 'package:some_animation_ex12/widgets/page_view/widgets/third_page/widgets/element_of_listview_widget.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, List<User>>(
      builder: (context, users) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20.0),
                height: 110.0,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 5.0),
                  itemBuilder: (context, index) => ElementOfListView(
                    element: users[index],
                  ),
                  itemCount: users.length,
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<GetUsersCubit>(context).getUsers();
                },
                onTapDown: (details) {
                  context.bloc<AnimationButtonCubit>().onTapDown();
                },
                onTapUp: (details) {
                  context.bloc<AnimationButtonCubit>().onTapUp();

                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
                onTapCancel: () {
                  context.bloc<AnimationButtonCubit>().onCancel();
                },
                child: BlocBuilder<AnimationButtonCubit, int>(
                  buildWhen: (previous, current) {
                    if (current == 2) {
                      return false;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    return Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          gradient: (state == 1)
                              ? LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                      Colors.white,
                                      Colors.grey[100],
                                      Colors.grey[350],
                                      Colors.grey
                                    ])
                              : null,
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: (state == 1) ? 5.0 : 10.0,
                            )
                          ]),
                      child: Center(
                        child: AnimatedIcon(
                          progress: _animationController,
                          icon: AnimatedIcons.play_pause,
                          color:
                              (state == 1) ? Colors.green[600] : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
