import 'package:equatable/equatable.dart';

class Parameter extends Equatable {
  final double horizontalPosition;
  final double page;

  Parameter({this.horizontalPosition, this.page});

  @override
  List<Object> get props => [horizontalPosition, page];
}

class User extends Comparable {
  final String name;
  final bool isOnline;

  User({this.name, this.isOnline});

  User copyWith({String name, bool isOnline}) {
    return User(
      name: name ?? this.name,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  @override
  int compareTo(other) {
    if (this.isOnline) {
      return -1;
    } else {
      return 1;
    }
  }
}

List<User> listOfUsers = [
  User(name: 'Joe1', isOnline: false),
  User(name: 'Joe2', isOnline: true),
  User(name: 'Joe3', isOnline: false),
  User(name: 'Joe4', isOnline: true),
  User(name: 'Joe5', isOnline: false),
  User(name: 'Joe6', isOnline: false),
]..sort((a, b) => a.compareTo(b));
