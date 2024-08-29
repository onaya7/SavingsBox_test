import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:savingsbox_test/core/injections/injection.dart';

import '../utils/logger.dart';

abstract class LocalDataStorage {
  Future<String?> getAccessToken();

  Future<void> saveAccessToken(String token);

  Future<String?> getRefreshToken();

  Future<void> saveRefreshToken(String token);

  Future<void> clear();
}

@LazySingleton(as: LocalDataStorage)
class LocalDataStorageImpl implements LocalDataStorage {
  LocalDataStorageImpl(
    this.box,
  );

  Box box = sl<Box<dynamic>>();

  @override
  Future<void> clear() async {
    try {
      await box.clear();
    } catch (e) {
      logger.i('Error clearing local data: $e');
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return box.get('accessToken');
    } catch (e) {
      logger.i('Error getting access token: $e');
      return '';
    }
  }

  @override
  Future<void> saveAccessToken(String token) async {
    try {
      await box.put('accessToken', token);
    } catch (e) {
      logger.i('Error saving access token: $e');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return box.get('refreshToken');
    } catch (e) {
      logger.i('Error getting refresh token: $e');
      return '';
    }
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    try {
      await box.put('refreshToken', token);
    } catch (e) {
      logger.i('Error saving refresh token: $e');
    }
  }
}
