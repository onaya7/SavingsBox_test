import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/features/task/domain/usecases/delete_task.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_event.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_state.dart';

import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/update_task.dart';

@lazySingleton
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTask createTask;
  final GetTasks getTasks;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;

  TaskBloc({
    required this.createTask,
    required this.getTasks,
    required this.updateTask,
    required this.deleteTask,
  }) : super(TaskInitial()) {
    on<CreateTaskEvent>(createTaskEvent);
    on<GetTasksEvent>(getTasksEvent);
    on<UpdateTaskEvent>(updateTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
  }

  FutureOr<void> createTaskEvent(
      CreateTaskEvent event, Emitter<TaskState> emit) async {
    emit(CreateTaskLoading());
    final failureOrTasks = await createTask(AddTaskParam(task: event.task));
    failureOrTasks.fold(
      (failure) => emit(CreateTaskError(message: failure.displayMessage)),
      (_) => emit(CreateTaskSuccess()),
    );
  }

  FutureOr<void> getTasksEvent(GetTasksEvent event, Emitter<TaskState> emit) {}

  FutureOr<void> updateTaskEvent(
      UpdateTaskEvent event, Emitter<TaskState> emit) {}

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) {}
}
