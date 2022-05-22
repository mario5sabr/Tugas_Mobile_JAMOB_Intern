import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:internmobile/src/model/task_relate.dart';
import 'package:internmobile/src/model/task_tag.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  factory Task({
    @JsonKey(name: "title") String? title,
    String? dueDateTime,
    String? description,
    String? imageUrl,
    @Default([]) List<TaskTag>? taskTags,
    TaskRelate? taskRelate,
  }) = _Task;
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
