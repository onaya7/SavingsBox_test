import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_event.dart';
import 'package:savingsbox_test/features/task/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>((event, emit) {});
  }
}
