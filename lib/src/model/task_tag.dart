import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'color_serialiser.dart';
part 'task_tag.g.dart';
part 'task_tag.freezed.dart';

@freezed
class TaskTag with _$TaskTag {
  factory TaskTag({
    @JsonKey(name: "tag") String? tag,
    @ColorSerialiser() @Default(ColorSerialiser.defaultColor) Color color,
  }) = _TaskTag;
  factory TaskTag.fromJson(Map<String, dynamic> json) =>
      _$TaskTagFromJson(json);
}
