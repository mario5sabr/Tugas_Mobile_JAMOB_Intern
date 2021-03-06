import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'task_relate.g.dart';
part 'task_relate.freezed.dart';

@freezed
class TaskRelate with _$TaskRelate {
  factory TaskRelate({
    int? counter,
    @Default([]) List<String>? profileCount,
  }) = _TaskRelate;
  factory TaskRelate.fromJson(Map<String, dynamic> json) =>
      _$TaskRelateFromJson(json);
}
