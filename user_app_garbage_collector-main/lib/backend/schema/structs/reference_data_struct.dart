// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReferenceDataStruct extends BaseStruct {
  ReferenceDataStruct({
    String? key,
    String? value,
    String? label,
  })  : _key = key,
        _value = value,
        _label = label;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;
  bool hasKey() => _key != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;
  bool hasValue() => _value != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  static ReferenceDataStruct fromMap(Map<String, dynamic> data) =>
      ReferenceDataStruct(
        key: data['key'] as String?,
        value: data['value'] as String?,
        label: data['label'] as String?,
      );

  static ReferenceDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ReferenceDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'key': _key,
        'value': _value,
        'label': _label,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReferenceDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReferenceDataStruct(
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReferenceDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReferenceDataStruct &&
        key == other.key &&
        value == other.value &&
        label == other.label;
  }

  @override
  int get hashCode => const ListEquality().hash([key, value, label]);
}

ReferenceDataStruct createReferenceDataStruct({
  String? key,
  String? value,
  String? label,
}) =>
    ReferenceDataStruct(
      key: key,
      value: value,
      label: label,
    );
