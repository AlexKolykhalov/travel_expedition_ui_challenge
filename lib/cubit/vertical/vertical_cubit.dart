import 'package:bloc/bloc.dart';

class VerticalCubit extends Cubit<double> {
  VerticalCubit() : super(0.0);
  // VerticalDragUpdateCubit(this.getOffsetCubit) : super(0.0) {
  //   getOffsetCubitSub = getOffsetCubit.listen((state) {
  //     if (state.page != 1) {
  //       //changeVerticalOffset(currentVerticalPosition: 0.0);
  //     }
  //   });
  // }

  // final GetOffsetCubit getOffsetCubit;
  // StreamSubscription getOffsetCubitSub;

  // @override
  // Future<void> close() {
  //   getOffsetCubitSub.cancel();
  //   return super.close();
  // }

  void setVerticalPosition({double currentVerticalPosition}) {
    return emit(currentVerticalPosition < 0.0 ? 0.0 : currentVerticalPosition);
  }
}
