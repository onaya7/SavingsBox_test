import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:savingsbox_test/core/constants/env.dart';

@module
abstract class RegisterModule {
  Box<dynamic> get box => Hive.box<dynamic>(Env.appDb!);
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}
