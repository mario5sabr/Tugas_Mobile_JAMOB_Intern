// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      title: json['title'] as String?,
      dueDateTime: json['dueDateTime'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      taskTags: (json['taskTags'] as List<dynamic>?)
              ?.map((e) => TaskTag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      taskRelate: json['taskRelate'] == null
          ? null
          : TaskRelate.fromJson(json['taskRelate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'title': instance.title,
      'dueDateTime': instance.dueDateTime,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'taskTags': instance.taskTags,
      'taskRelate': instance.taskRelate,
    };
