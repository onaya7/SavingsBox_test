import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/core/constants/firebase_collections.dart';
import 'package:savingsbox_test/features/task/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<void> addTask({required TaskModel taskModel});
  Future<List<TaskModel>> getTasks();
  Future<void> updateTask({required TaskModel taskModel});
  Future<void> deleteTask({required String id});
}

@LazySingleton(as: TaskRemoteDataSource)
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  TaskRemoteDataSourceImpl(this._firebaseAuth, this._firebaseFirestore);

  // @override
  // Future<TaskModel?> addTask({required TaskModel taskModel}) async {
  //   final user = _firebaseAuth.currentUser;
  //   if (user != null) {
  //     final taskCollection =
  //         _firebaseFirestore.collection(FirebaseCollection.tasks);
  //     TaskModel task = taskModel;
  //     task.id = taskCollection.doc().id;
  //     task.userId = user.uid;
  //     task.isCompleted = false;
  //     task.startDate = DateTime.now();
  //     task.endDate = DateTime.now().add(const Duration(days: 1));
  //     final taskDoc = await taskCollection.add(task.toJson());
  //     final taskData = await taskDoc.get();
  //     return TaskModel.fromJson(taskData.data()!);
  //   }
  //   return null;
  // }
  @override
  Future<TaskModel?> addTask({required TaskModel taskModel}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final taskCollection =
          _firebaseFirestore.collection(FirebaseCollection.tasks);
      final docRef = taskCollection.doc();
      TaskModel task = taskModel;
      task.id = docRef.id;
      task.userId = user.uid;
      task.isCompleted = false;
      task.startDate = DateTime.now();
      task.endDate = DateTime.now().add(const Duration(days: 1));
      await docRef.set(task.toJson());
      final taskData = await docRef.get();
      return TaskModel.fromJson(taskData.data()!);
    }
    return null;
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final taskCollection =
          _firebaseFirestore.collection(FirebaseCollection.tasks);
      final taskData = await taskCollection
          .where('userId', isEqualTo: user.uid)
          .orderBy('startDate', descending: true)
          .get();
      return taskData.docs
          .map((task) => TaskModel.fromJson(task.data()))
          .toList();
    }
    return [];
  }

  @override
  Future<void> updateTask({required TaskModel taskModel}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final taskCollection =
          _firebaseFirestore.collection(FirebaseCollection.tasks);
      await taskCollection.doc(taskModel.id).update(taskModel.toJson());
    }
  }

  @override
  Future<void> deleteTask({required String id}) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final taskCollection =
          _firebaseFirestore.collection(FirebaseCollection.tasks);
      await taskCollection.doc(id).delete();
    }
  }
}
