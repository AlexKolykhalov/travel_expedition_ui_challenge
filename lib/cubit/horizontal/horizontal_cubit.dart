import 'package:bloc/bloc.dart';

import 'package:some_animation_ex12/models.dart';

class HorizontalCubit extends Cubit<Parameter> {
  HorizontalCubit() : super(Parameter(horizontalPosition: 0.0, page: 0.0));

  void setParameter({Parameter parameter}) => emit(parameter);
}
