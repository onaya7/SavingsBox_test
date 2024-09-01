import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entities.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignUpWithEmailAndPassword implements UseCase<UserEntity, SignUpParams> {
  final AuthRepository repository;

  SignUpWithEmailAndPassword(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await repository.signUpWithEmailAndPassword(
        params.email, params.password);
  }
}

class SignUpParams {
  final String email;
  final String password;

  SignUpParams({required this.email, required this.password});
}
