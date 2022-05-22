import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task_toDo.freezed.dart';

part 'task_toDo.g.dart';

@freezed
class TaskTodo with _$TaskTodo {
  factory TaskTodo({
    required String priority,
    required String title,
    required String dueDateTime,
  }) = _TaskTodo;

  factory TaskTodo.fromJson(Map<String, dynamic> json) =>
      _$TaskTodoFromJson(json);
}
