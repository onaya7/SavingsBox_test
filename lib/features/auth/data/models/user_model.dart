import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entities.dart';


class UserModel extends UserEntity {
  const UserModel({required super.id, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(id: user.uid, email: user.email!);
  }
}

