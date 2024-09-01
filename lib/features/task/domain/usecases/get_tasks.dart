import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';
import 'package:savingsbox_test/features/task/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class GetTasks implements UseCase<List<TaskModel>, NoParams> {
  final TaskRepository repository;

  GetTasks(this.repository);

  @override
  Future<Either<Failure, List<TaskModel>>> call(NoParams params) async {
    return await repository.getTasks();
  }
}
