import 'package:bloc/bloc.dart';

class AnimationButtonCubit extends Cubit<int> {
  AnimationButtonCubit() : super(0);

  void onTapDown() {
    if (state == 0) {
      return emit(1);
    }
    return emit(2);
  }

  void onTapUp() {
    if (state == 1) {
      return emit(2);
    }
    return emit(0);
  }

  void onCancel() {
    if (state == 1) {
      return emit(0);
    }
    return emit(2);
  }
}
