import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/features/task/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/task_model.dart';

@lazySingleton
class UpdateTask implements UseCase<void, UpdateTaskParam> {
  final TaskRepository repository;

  UpdateTask(this.repository);

  @override
  Future<Either<Failure, void>> call(UpdateTaskParam params) async {
    return await repository.updateTask(
      task: params.task,
    );
  }
}

class UpdateTaskParam {
  final TaskModel task;

  UpdateTaskParam({required this.task});
}
