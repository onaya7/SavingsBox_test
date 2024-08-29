import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entities.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignInWithEmailAndPassword implements UseCase<UserEntity, SigninParams> {
  final AuthRepository repository;

  SignInWithEmailAndPassword(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SigninParams params) async {
    return await repository.signInWithEmailAndPassword(
      params.email,
      params.password,
    );
  }
}

class SigninParams {
  final String email;
  final String password;

  SigninParams({required this.email, required this.password});
}
