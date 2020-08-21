import 'package:bloc/bloc.dart';

class MapAnimationCubit extends Cubit<double> {
  MapAnimationCubit() : super(0.0);

  void setTweenAnimation({val}) => emit(val);
}
