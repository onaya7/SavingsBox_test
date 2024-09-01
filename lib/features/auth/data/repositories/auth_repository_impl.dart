import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entities.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final user =
          await remoteDataSource.signInWithEmailAndPassword(email, password);
      return Right(UserEntity(id: user!.uid, email: user.email!));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final user =
          await remoteDataSource.signUpWithEmailAndPassword(email, password);
      return Right(UserEntity(id: user!.uid, email: user.email!));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } on Exception {
      return const Left(ServerFailure(message: 'Failed to sign out'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      if (user == null) {
        return const Left(ServerFailure(message: 'No user signed in'));
      }
      return Right(UserEntity(id: user.uid, email: user.email!));
    } on Exception {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await remoteDataSource.resetPassword(email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
