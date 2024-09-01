import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TaskModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "id")
  String? id;

  @HiveField(1)
  @JsonKey(name: "userId")
  String? userId;

  @HiveField(2)
  @JsonKey(name: "name")
  String? name;

  @HiveField(3)
  @JsonKey(name: "description")
  String? description;

  @HiveField(4)
  @JsonKey(name: "isCompleted")
  bool? isCompleted;

  @HiveField(5)
  @JsonKey(
    name: "startDate",
    fromJson: _fromTimestamp,
    toJson: _toTimestamp,
  )
  DateTime? startDate;

  @HiveField(6)
  @JsonKey(
    name: "endDate",
    fromJson: _fromTimestamp,
    toJson: _toTimestamp,
  )
  DateTime? endDate;

  @HiveField(7)
  String? taskCategory;

  TaskModel({
    this.id,
    this.userId,
    this.name,
    this.description,
    this.isCompleted,
    this.startDate,
    this.endDate,
    this.taskCategory,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  static DateTime? _fromTimestamp(Timestamp? timestamp) {
    return timestamp?.toDate();
  }

  static Timestamp? _toTimestamp(DateTime? date) {
    return date != null ? Timestamp.fromDate(date) : null;
  }

  TaskModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? description,
    bool? isCompleted,
    DateTime? startDate,
    DateTime? endDate,
    String? taskCategory,
  }) {
    return TaskModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      taskCategory: taskCategory ?? this.taskCategory,
    );
  }
}