// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_relate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskRelate _$$_TaskRelateFromJson(Map<String, dynamic> json) =>
    _$_TaskRelate(
      counter: json['counter'] as int?,
      profileCount: (json['profileCount'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TaskRelateToJson(_$_TaskRelate instance) =>
    <String, dynamic>{
      'counter': instance.counter,
      'profileCount': instance.profileCount,
    };
