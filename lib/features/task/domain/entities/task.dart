import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String description;
  final bool isCompleted;
  final DateTime startDate;
  final DateTime endDate;

  const TaskEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.isCompleted,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props =>
      [id, userId, name, description, isCompleted, startDate, endDate];
}
