import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:savingsbox_test/firebase_options.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Hive.initFlutter();
  // await registerDependencies();
  runApp(
    const MyApp(),
  );
}
