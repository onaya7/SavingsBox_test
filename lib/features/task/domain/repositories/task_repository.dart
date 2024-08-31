import 'package:dartz/dartz.dart' hide Task;
import 'package:savingsbox_test/features/task/data/models/task_model.dart';

import '../../../../core/error/failure.dart';

abstract class TaskRepository {
  Future<Either<Failure, void>> addTask({
    required TaskModel task,
  });

  Future<Either<Failure, List<TaskModel>>> getTasks();

  Future<Either<Failure, void>> updateTask({
    required TaskModel task,
  });

  Future<Either<Failure, void>> deleteTask({
    required String id,
  });
}
