import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_currentuser_usecase.dart';
import '../../domain/usecases/signin_usecase.dart';
import '../../domain/usecases/signout_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPassword signInWithEmailAndPassword;
  final SignOut signOut;
  final SignUpWithEmailAndPassword signUpWithEmailAndPassword;
  final GetCurrentUser getCurrentUser;

  AuthBloc({
    required this.signInWithEmailAndPassword,
    required this.signOut,
    required this.signUpWithEmailAndPassword,
    required this.getCurrentUser,
  }) : super(AuthInitial()) {
    on<SignInEvent>(signInEvent);
    on<SignOutEvent>(signOutEvent);
    on<SignUpEvent>(signUpEvent);
    on<CheckAuthEvent>(checkAuthEvent);
  }

  FutureOr<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(SignInLoading());
    final failureOrUser = await signInWithEmailAndPassword(
        SigninParams(email: event.email, password: event.password));
    failureOrUser.fold(
      (failure) => emit(SignInError(message: failure.displayMessage)),
      (user) => emit(SignInSuccess(user: user)),
    );
  }

  FutureOr<void> signUpEvent(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoading());
    final failureOrUser = await signUpWithEmailAndPassword(
        Params(email: event.email, password: event.password));
    failureOrUser.fold(
      (failure) => emit(SignUpError(message: failure.displayMessage)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }

  FutureOr<void> signOutEvent(
      SignOutEvent event, Emitter<AuthState> emit) async {
    emit(SignOutLoading());
    final failureOrVoid = await signOut(NoParams());
    // logger.d('failureOrVoid: $failureOrVoid');
    // logger.d('failure: {$failureOrVoid}');
    // failureOrVoid.fold(
    //   (failure) => logger.d('failureOrVoid: $failureOrVoid'),
    //   (_) => logger.d('failure: {$failureOrVoid}'),
    // );

    failureOrVoid.fold(
      (failure) => emit(SignOutError(message: failure.displayMessage)),
      (_) => emit(const SignOutSuccess(message: 'User signed out')),
    );
  }

  FutureOr<void> checkAuthEvent(CheckAuthEvent event, Emitter<AuthState> emit) {
    on<CheckAuthEvent>(
      (event, emit) async {
        emit(AuthLoading());
        final failureOrUser = await getCurrentUser(NoParams());
        failureOrUser.fold(
          (failure) =>
              emit(AuthUnauthenticated(message: failure.displayMessage)),
          (user) => emit(AuthAuthenticated(user: user)),
        );
      },
    );
  }
}
