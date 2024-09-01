import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/features/task/data/datasources/task_local_datasource.dart';
import 'package:savingsbox_test/features/task/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../datasources/task_remote_datasource.dart';
import '../models/task_model.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, void>> addTask({
    required TaskModel task,
  }) async {
    try {
      await localDataSource.addTask(taskModel: task);
      await remoteDataSource.addTask(taskModel: task);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getTasks() async {
    try {
      try {
        final tasks = await remoteDataSource.getTasks();
        for (final task in tasks) {
          await localDataSource.addTask(taskModel: task);
        }
        return Right(tasks);
      } catch (e) {
        final tasks = await localDataSource.getTasks();
        return Right(tasks);
      }
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask({
    required TaskModel task,
  }) async {
    try {
      await localDataSource.updateTask(taskModel: task);
      await remoteDataSource.updateTask(taskModel: task);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask({
    required String id,
  }) async {
    try {
      await localDataSource.deleteTask(id: id);
      await remoteDataSource.deleteTask(id: id);
      return const Right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
