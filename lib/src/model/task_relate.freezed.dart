// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_relate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskRelate _$TaskRelateFromJson(Map<String, dynamic> json) {
  return _TaskRelate.fromJson(json);
}

/// @nodoc
mixin _$TaskRelate {
  int? get counter => throw _privateConstructorUsedError;
  List<String>? get profileCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskRelateCopyWith<TaskRelate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskRelateCopyWith<$Res> {
  factory $TaskRelateCopyWith(
          TaskRelate value, $Res Function(TaskRelate) then) =
      _$TaskRelateCopyWithImpl<$Res>;
  $Res call({int? counter, List<String>? profileCount});
}

/// @nodoc
class _$TaskRelateCopyWithImpl<$Res> implements $TaskRelateCopyWith<$Res> {
  _$TaskRelateCopyWithImpl(this._value, this._then);

  final TaskRelate _value;
  // ignore: unused_field
  final $Res Function(TaskRelate) _then;

  @override
  $Res call({
    Object? counter = freezed,
    Object? profileCount = freezed,
  }) {
    return _then(_value.copyWith(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int?,
      profileCount: profileCount == freezed
          ? _value.profileCount
          : profileCount // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$TaskRelateCopyWith<$Res> implements $TaskRelateCopyWith<$Res> {
  factory _$TaskRelateCopyWith(
          _TaskRelate value, $Res Function(_TaskRelate) then) =
      __$TaskRelateCopyWithImpl<$Res>;
  @override
  $Res call({int? counter, List<String>? profileCount});
}

/// @nodoc
class __$TaskRelateCopyWithImpl<$Res> extends _$TaskRelateCopyWithImpl<$Res>
    implements _$TaskRelateCopyWith<$Res> {
  __$TaskRelateCopyWithImpl(
      _TaskRelate _value, $Res Function(_TaskRelate) _then)
      : super(_value, (v) => _then(v as _TaskRelate));

  @override
  _TaskRelate get _value => super._value as _TaskRelate;

  @override
  $Res call({
    Object? counter = freezed,
    Object? profileCount = freezed,
  }) {
    return _then(_TaskRelate(
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int?,
      profileCount: profileCount == freezed
          ? _value.profileCount
          : profileCount // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskRelate with DiagnosticableTreeMixin implements _TaskRelate {
  _$_TaskRelate({this.counter, final List<String>? profileCount = const []})
      : _profileCount = profileCount;

  factory _$_TaskRelate.fromJson(Map<String, dynamic> json) =>
      _$$_TaskRelateFromJson(json);

  @override
  final int? counter;
  final List<String>? _profileCount;
  @override
  @JsonKey()
  List<String>? get profileCount {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profileCount!);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaskRelate(counter: $counter, profileCount: $profileCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaskRelate'))
      ..add(DiagnosticsProperty('counter', counter))
      ..add(DiagnosticsProperty('profileCount', profileCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskRelate &&
            const DeepCollectionEquality().equals(other.counter, counter) &&
            const DeepCollectionEquality()
                .equals(other.profileCount, profileCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(counter),
      const DeepCollectionEquality().hash(profileCount));

  @JsonKey(ignore: true)
  @override
  _$TaskRelateCopyWith<_TaskRelate> get copyWith =>
      __$TaskRelateCopyWithImpl<_TaskRelate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskRelateToJson(this);
  }
}

abstract class _TaskRelate implements TaskRelate {
  factory _TaskRelate({final int? counter, final List<String>? profileCount}) =
      _$_TaskRelate;

  factory _TaskRelate.fromJson(Map<String, dynamic> json) =
      _$_TaskRelate.fromJson;

  @override
  int? get counter => throw _privateConstructorUsedError;
  @override
  List<String>? get profileCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TaskRelateCopyWith<_TaskRelate> get copyWith =>
      throw _privateConstructorUsedError;
}
