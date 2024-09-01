import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:savingsbox_test/core/constants/env.dart';

import '../../features/task/data/models/task_model.dart';

@module
abstract class RegisterModule {
  Box<TaskModel> get taskBox => Hive.box<TaskModel>(Env.appDb!);
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}
