import 'package:bloc/bloc.dart';
import 'package:some_animation_ex12/models.dart';

class GetUsersCubit extends Cubit<List<User>> {
  GetUsersCubit() : super(listOfUsers);

  void getUsers() {
    List<User> newListOfUsers = state
        .map((e) => e.copyWith(isOnline: !e.isOnline))
        .toList()
          ..sort((a, b) => a.compareTo(b));

    return emit(newListOfUsers);
  }
}
