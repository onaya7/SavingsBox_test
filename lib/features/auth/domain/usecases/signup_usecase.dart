import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entities.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignUpWithEmailAndPassword implements UseCase<UserEntity, Params> {
  final AuthRepository repository;

  SignUpWithEmailAndPassword(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.signUpWithEmailAndPassword(
        params.email, params.password);
  }
}

class Params {
  final String email;
  final String password;

  Params({required this.email, required this.password});
}
