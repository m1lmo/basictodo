// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) => TodoModel(
      title: json['title'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) => <String, dynamic>{
      'title': instance.title,
      'time': instance.time?.toIso8601String(),
      'isDone': instance.isDone,
    };
