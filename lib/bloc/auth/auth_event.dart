part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  @override
  String toString() => 'LoggedIn';

  final String email;
  final String passwords;

  const LoggedIn(this.email, this.passwords);

  @override
  List<Object?> get props => [email, passwords];
}

class LoggedOut extends AuthEvent {
  @override
  String toString() => 'LoggedOut';
}

class CreateUser extends AuthEvent {
  final String email;
  final String passwords;

  const CreateUser(this.email, this.passwords);

  @override
  List<Object?> get props => [email, passwords];
}
