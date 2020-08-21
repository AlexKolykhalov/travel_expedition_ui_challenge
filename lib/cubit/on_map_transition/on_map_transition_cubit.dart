import 'package:bloc/bloc.dart';

class OnMapTransitionCubit extends Cubit<bool> {
  OnMapTransitionCubit() : super(false);

  void onMapTransition({showMap}) => emit(showMap);
}
