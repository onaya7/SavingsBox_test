import 'package:equatable/equatable.dart';

import '../../domain/entities/user_entities.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

//Auth states

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  final String message;

  const AuthUnauthenticated({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

// Sign-in states
class SignInLoading extends AuthState {}

class SignInSuccess extends AuthState {
  final UserEntity user;

  const SignInSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class SignInError extends AuthState {
  final String message;

  const SignInError({required this.message});

  @override
  List<Object> get props => [message];
}

// Sign-up states
class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {
  final UserEntity user;

  const SignUpSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class SignUpError extends AuthState {
  final String message;

  const SignUpError({required this.message});

  @override
  List<Object> get props => [message];
}

//Sign-out states
class SignOutLoading extends AuthState {}

class SignOutSuccess extends AuthState {
  final String message;

  const SignOutSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class SignOutError extends AuthState {
  final String message;

  const SignOutError({required this.message});

  @override
  List<Object> get props => [message];
}

//Reset password states
class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {
  final String message;

  const ResetPasswordSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class ResetPasswordError extends AuthState {
  final String message;

  const ResetPasswordError({required this.message});

  @override
  List<Object> get props => [message];
}
