import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;

  const User({required this.id, required this.name, required this.email});

  @override
  List<Object?> get props => [id, name, email];
}

class LoggedUser extends User {
  final String token;

  const LoggedUser({
    required super.id,
    required super.name,
    required super.email,
    required this.token,
  });

  @override
  List<Object?> get props => [id, name, email, token];
}

class NotLoggedUser extends User {
  const NotLoggedUser({super.id = '', super.name = '', super.email = ''});
}
