/// https://developer.school/flutter-using-json_serializable-to-serialise-dart-classes/
/// https://stackoverflow.com/questions/56907831/flutter-json-serializable-how-to-serialize-a-dart-class-to-json-and-back

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorSerialiser implements JsonConverter<Color, int> {
  const ColorSerialiser();
  static const Color defaultColor = Color.fromRGBO(0, 0, 0, 0);

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}
