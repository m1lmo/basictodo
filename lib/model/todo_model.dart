import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel {
  final String? title;
  final DateTime? time;
  bool? isDone;

  TodoModel({this.title, this.time, this.isDone});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return _$TodoModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TodoModelToJson(this);
  }
}
