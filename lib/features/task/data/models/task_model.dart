import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "taskStatus")
  final String? taskStatus;
  @JsonKey(
    name: "startDate",
    fromJson: _fromTimestamp,
    toJson: _toTimestamp,
  )
  final DateTime? startDate;
  @JsonKey(
    name: "endDate",
    fromJson: _fromTimestamp,
    toJson: _toTimestamp,
  )
  final DateTime? endDate;
  @JsonKey(name: "userId")
  final String? userId;

  TaskModel({
    this.id,
    this.name,
    this.description,
    this.taskStatus,
    this.startDate,
    this.endDate,
    this.userId,
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
}
