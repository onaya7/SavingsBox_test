import 'package:equatable/equatable.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class CreateTaskLoading extends TaskState {}

class CreateTaskSuccess extends TaskState {}

class CreateTaskError extends TaskState {
  final String message;

  const CreateTaskError({required this.message});

  @override
  List<Object> get props => [message];
}

class GetTasksLoading extends TaskState {}

class GetTasksSuccess extends TaskState {
  final List<TaskModel> tasks;

  const GetTasksSuccess({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class GetTasksError extends TaskState {
  final String message;

  const GetTasksError({required this.message});

  @override
  List<Object> get props => [message];
}

class UpdateTaskLoading extends TaskState {}

class UpdateTaskSuccess extends TaskState {
  const UpdateTaskSuccess();

  @override
  List<Object> get props => [];
}

class UpdateTaskError extends TaskState {
  final String message;

  const UpdateTaskError({required this.message});

  @override
  List<Object> get props => [message];
}

class DeleteTaskLoading extends TaskState {}

class DeleteTaskSuccess extends TaskState {
  const DeleteTaskSuccess();

  @override
  List<Object> get props => [];
}

class DeleteTaskError extends TaskState {
  final String message;

  const DeleteTaskError({required this.message});

  @override
  List<Object> get props => [message];
}
