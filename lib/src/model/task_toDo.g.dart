// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_toDo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskTodo _$$_TaskTodoFromJson(Map<String, dynamic> json) => _$_TaskTodo(
      priority: json['priority'] as String,
      title: json['title'] as String,
      dueDateTime: json['dueDateTime'] as String,
    );

Map<String, dynamic> _$$_TaskTodoToJson(_$_TaskTodo instance) =>
    <String, dynamic>{
      'priority': instance.priority,
      'title': instance.title,
      'dueDateTime': instance.dueDateTime,
    };
