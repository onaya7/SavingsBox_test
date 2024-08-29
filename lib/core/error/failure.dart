import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  String get defaultMessage;

  String get displayMessage => message ?? defaultMessage;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message});

  @override
  String get defaultMessage => 'Server Error';
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});

  @override
  String get defaultMessage => 'Cache Error';
}
