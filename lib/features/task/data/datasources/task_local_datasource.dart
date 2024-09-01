import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/logger.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<void> addTask({required TaskModel taskModel});
  Future<List<TaskModel>> getTasks();
  Future<void> updateTask({required TaskModel taskModel});
  Future<void> deleteTask({required String id});
}

@LazySingleton(as: TaskLocalDataSource)
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> taskBox;

  TaskLocalDataSourceImpl(
    this.taskBox,
  );

  @override
  Future<void> addTask({required TaskModel taskModel}) async {
    try {
      await taskBox.add(taskModel);
    } catch (e) {
      logger.i('Error adding task local data: $e');
    }
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      return taskBox.values.toList();
    } catch (e) {
      logger.i('Error getting task local data: $e');
      return [];
    }
  }

  @override
  Future<void> updateTask({required TaskModel taskModel}) async {
    try {
      await taskBox.put(taskModel.id, taskModel);
    } catch (e) {
      logger.i('Error updating task local data: $e');
    }
  }

  @override
  Future<void> deleteTask({required String id}) async {
    try {
      await taskBox.delete(id);
    } catch (e) {
      logger.i('Error deleting task local data: $e');
    }
  }
}
