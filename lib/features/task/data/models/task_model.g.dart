// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 0;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      id: fields[0] as String?,
      userId: fields[1] as String?,
      name: fields[2] as String?,
      description: fields[3] as String?,
      isCompleted: fields[4] as bool?,
      startDate: fields[5] as DateTime?,
      endDate: fields[6] as DateTime?,
      taskCategory: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.isCompleted)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.taskCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      startDate: TaskModel._fromTimestamp(json['startDate'] as Timestamp?),
      endDate: TaskModel._fromTimestamp(json['endDate'] as Timestamp?),
      taskCategory: json['taskCategory'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'startDate': TaskModel._toTimestamp(instance.startDate),
      'endDate': TaskModel._toTimestamp(instance.endDate),
      'taskCategory': instance.taskCategory,
    };
