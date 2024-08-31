// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      taskStatus: json['taskStatus'] as String?,
      startDate: TaskModel._fromTimestamp(json['startDate'] as Timestamp?),
      endDate: TaskModel._fromTimestamp(json['endDate'] as Timestamp?),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'taskStatus': instance.taskStatus,
      'startDate': TaskModel._toTimestamp(instance.startDate),
      'endDate': TaskModel._toTimestamp(instance.endDate),
      'userId': instance.userId,
    };
