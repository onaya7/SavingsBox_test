import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, void>> resetPassword(String email);
}
