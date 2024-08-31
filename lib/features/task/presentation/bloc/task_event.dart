import 'package:equatable/equatable.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateTaskEvent extends TaskEvent {
  final TaskModel task;

  const CreateTaskEvent({required this.task});

  @override
  List<Object> get props => [task];
}

class GetTasksEvent extends TaskEvent {}

class UpdateTaskEvent extends TaskEvent {
  final String id;
  final String title;
  final String description;

  const UpdateTaskEvent(
      {required this.id, required this.title, required this.description});

  @override
  List<Object> get props => [id, title, description];
}

class DeleteTaskEvent extends TaskEvent {
  final String id;

  const DeleteTaskEvent({required this.id});

  @override
  List<Object> get props => [id];
}
