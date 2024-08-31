import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/features/task/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/task_model.dart';

@lazySingleton
class CreateTask implements UseCase<void, AddTaskParam> {
  final TaskRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Failure, void>> call(AddTaskParam params) async {
    return await repository.addTask(
      task: params.task,
    );
  }
}

class AddTaskParam {
  final TaskModel task;

  AddTaskParam({required this.task});
}
