import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/core/constants/firebase_collections.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel?> addTask({required TaskModel taskModel});
  Future<List<TaskModel>> getTasks();
  Future<void> updateTask({required TaskModel taskModel});
  Future<void> deleteTask({required String id});
}

@LazySingleton(as: TaskRemoteDataSource)
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  TaskRemoteDataSourceImpl(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<TaskModel?> addTask({required TaskModel taskModel}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final taskCollection =
          _firebaseFirestore.collection(FirebaseCollection.tasks);
      final task = taskModel.toJson();
      task["id"] = taskCollection.doc().id;
      task["userId"] = user.uid;
      task["taskStatus"] = "pending";
      task["startDate"] = DateTime.now();
      final taskDoc = await taskCollection.add(task);
      final taskData = await taskDoc.get();
      return TaskModel.fromJson(taskData.data()!);
    }
    return null;
  }

  @override
  Future<void> deleteTask({required String id}) async {}

  @override
  Future<List<TaskModel>> getTasks() async {
    return [];
  }

  @override
  Future<void> updateTask({required TaskModel taskModel}) async {}
}
