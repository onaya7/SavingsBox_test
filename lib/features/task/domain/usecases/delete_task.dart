import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/features/task/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

@lazySingleton
class DeleteTask implements UseCase<void, DeleteTaskParam> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteTaskParam params) async {
    return await repository.deleteTask(
      id: params.id,
    );
  }
}

class DeleteTaskParam {
  final String id;

  DeleteTaskParam({required this.id});
}
