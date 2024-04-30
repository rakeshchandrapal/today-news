import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(Uninitialized()) {

    on<CreateUser>(_onCreateUser);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  FutureOr<void> _onCreateUser(
      CreateUser event, Emitter<AuthState> emit) async {
    try {
      await _userRepository.signUp(
        email: event.email,
        password: event.passwords,
      );
      emit(
        Authenticated(
          await _userRepository.getUser(),
        ),
      );
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  FutureOr<void> _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) async{
    try {
      await _userRepository.signInWithCredentials(
        event.email,
        event.passwords,
      );
      emit(
        Authenticated(
          await _userRepository.getUser(),
        ),
      );
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  Future<FutureOr<void>> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    try {
      await _userRepository.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(Unauthenticated());
    }

  }
}
