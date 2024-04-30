part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class Uninitialized extends AuthState {
  @override
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthState {

  final String email;

  const Authenticated(this.email);
  @override
  List<Object?> get props => [ email];
  @override
  String toString() => 'Authenticated { email : $email }';
}

class Unauthenticated extends AuthState {
  @override
  String toString() => 'Unauthenticated';
}