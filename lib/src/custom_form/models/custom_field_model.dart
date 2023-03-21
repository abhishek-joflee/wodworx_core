// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../common/common_models.dart';
import '../utils/custom_field_enum.dart';

List<CustomField> customFieldListFromJson(String str) => List<CustomField>.from(
      json.decode(str).map((x) => CustomField.fromJson(x)),
    );

CustomField customFieldFromJson(String str) =>
    CustomField.fromJson(json.decode(str));

String customFieldListToJson(List<CustomField> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String customFieldToJson(CustomField data) => json.encode(data.toJson());

class CustomField {
  CustomField({
    required this.fieldType,
    this.fieldTypeName,
    this.fieldLabel,
    this.dataName,
    this.dataType,
    required this.isRequired,
    this.placeholderText,
    this.defaultValue,
    this.rules,
    this.showLimit,
    this.min,
    this.max,
    this.showMoreLabel,
    this.showLessLabel,
    this.values,
  });

  final CustomFieldTypes fieldType;
  final String? fieldTypeName;
  final String? fieldLabel;
  final String? dataName;
  final String? dataType;
  final bool isRequired;
  final String? placeholderText;
  final dynamic defaultValue;
  final List<CustomFieldRule>? rules;
  final int? showLimit;
  final int? min;
  final int? max;
  final String? showMoreLabel;
  final String? showLessLabel;
  final List<CustomFieldValue>? values;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        fieldType: ((json['field_type'] as String?) ?? '').customFieldType,
        fieldTypeName: json['field_type'] as String?,
        fieldLabel: json['field_label'],
        dataName: json['data_name'],
        dataType: json['data_type'],
        isRequired: json['is_required'] ?? false,
        placeholderText: json['placeholder_text'],
        defaultValue: json['default_value'],
        rules: json['rules'] == null
            ? null
            : List<CustomFieldRule>.from(
                json['rules'].map((x) => CustomFieldRule.fromJson(x)),
              ),
        showLimit: json['show_limit'] == null
            ? null
            : int.parse(json['show_limit'].toString()),
        min: json['min'] == null ? null : int.parse(json['min'].toString()),
        max: json['max'] == null ? null : int.parse(json['max'].toString()),
        showMoreLabel: json['show_more_label'],
        showLessLabel: json['show_less_label'],
        values: json['values'] == null
            ? null
            : List<CustomFieldValue>.from(
                json['values'].map((x) => CustomFieldValue.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        'field_type': fieldType,
        'field_type_name': fieldTypeName,
        'field_label': fieldLabel,
        'data_name': dataName,
        'data_type': dataType,
        'is_required': isRequired,
        'placeholder_text': placeholderText,
        'default_value': defaultValue,
        'rules': rules == null
            ? null
            : List<dynamic>.from(rules!.map((x) => x.toJson())),
        'show_limit': showLimit,
        'min': min,
        'max': max,
        'show_more_label': showMoreLabel,
        'show_less_label': showLessLabel,
        'values': values == null
            ? null
            : List<dynamic>.from(values!.map((x) => x.toJson())),
      };

  CustomField copyWith({
    CustomFieldTypes? fieldType,
    String? fieldLabel,
    String? dataName,
    String? dataType,
    bool? isRequired,
    String? placeholderText,
    dynamic defaultValue,
    List<CustomFieldRule>? rules,
    int? showLimit,
    int? min,
    int? max,
    String? showMoreLabel,
    String? showLessLabel,
    List<CustomFieldValue>? values,
  }) =>
      CustomField(
        fieldType: fieldType ?? this.fieldType,
        fieldLabel: fieldLabel ?? this.fieldLabel,
        dataName: dataName ?? this.dataName,
        dataType: dataType ?? this.dataType,
        isRequired: isRequired ?? this.isRequired,
        placeholderText: placeholderText ?? this.placeholderText,
        defaultValue: defaultValue ?? this.defaultValue,
        rules: rules ?? this.rules,
        showLimit: showLimit ?? this.showLimit,
        min: min ?? this.min,
        max: max ?? this.max,
        showMoreLabel: showMoreLabel ?? this.showMoreLabel,
        showLessLabel: showLessLabel ?? this.showLessLabel,
        values: values ?? this.values,
      );

  @override
  bool operator ==(covariant CustomField other) {
    if (identical(this, other)) return true;

    return other.fieldType == fieldType &&
        other.fieldTypeName == fieldTypeName &&
        other.fieldLabel == fieldLabel &&
        other.dataName == dataName &&
        other.dataType == dataType &&
        other.isRequired == isRequired &&
        other.placeholderText == placeholderText &&
        other.defaultValue == defaultValue &&
        listEquals(other.rules, rules) &&
        other.showLimit == showLimit &&
        other.min == min &&
        other.max == max &&
        other.showMoreLabel == showMoreLabel &&
        other.showLessLabel == showLessLabel &&
        listEquals(other.values, values);
  }

  @override
  int get hashCode =>
      fieldType.hashCode ^
      fieldTypeName.hashCode ^
      fieldLabel.hashCode ^
      dataName.hashCode ^
      dataType.hashCode ^
      isRequired.hashCode ^
      placeholderText.hashCode ^
      defaultValue.hashCode ^
      rules.hashCode ^
      showLimit.hashCode ^
      min.hashCode ^
      max.hashCode ^
      showMoreLabel.hashCode ^
      showLessLabel.hashCode ^
      values.hashCode;
}

class CustomFieldRule {
  CustomFieldRule({
    this.regex,
    this.message,
  });

  final String? regex;
  final String? message;

  factory CustomFieldRule.fromJson(Map<String, dynamic> json) =>
      CustomFieldRule(
        regex: json['regex'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'regex': regex,
        'message': message,
      };

  CustomFieldRule copyWith({
    String? regex,
    String? message,
  }) =>
      CustomFieldRule(
        regex: regex ?? this.regex,
        message: message ?? this.message,
      );

  @override
  bool operator ==(covariant CustomFieldRule other) {
    if (identical(this, other)) return true;

    return other.regex == regex && other.message == message;
  }

  @override
  int get hashCode => regex.hashCode ^ message.hashCode;
}

class CustomFieldValue {
  CustomFieldValue({
    this.label,
    this.value,
    this.textColor,
    this.bgColor,
    this.icon,
  });

  final String? label;
  final String? value;
  final String? textColor;
  final String? bgColor;
  final IconElementModel? icon;

  factory CustomFieldValue.fromJson(Map<String, dynamic> json) =>
      CustomFieldValue(
        label: json['label'],
        value: json['value'],
        textColor: json['text_color'],
        bgColor: json['bg_color'],
        icon: json['icon'] == null
            ? null
            : IconElementModel.fromJson(json['icon']),
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
        'text_color': textColor,
        'bg_color': bgColor,
        'icon': icon,
      };

  CustomFieldValue copyWith({
    String? label,
    String? value,
    String? textColor,
    String? bgColor,
    IconElementModel? icon,
  }) =>
      CustomFieldValue(
        label: label ?? this.label,
        value: value ?? this.value,
        textColor: textColor ?? this.textColor,
        bgColor: bgColor ?? this.bgColor,
        icon: icon ?? this.icon,
      );

  @override
  String toString() =>
      'CustomFieldValue(label: $label, value: $value, textColor: $textColor, bgColor: $bgColor, icon: $icon)';

  @override
  bool operator ==(covariant CustomFieldValue other) {
    if (identical(this, other)) return true;

    return other.label == label &&
        other.value == value &&
        other.textColor == textColor &&
        other.bgColor == bgColor &&
        other.icon == icon;
  }

  @override
  int get hashCode =>
      label.hashCode ^
      value.hashCode ^
      textColor.hashCode ^
      bgColor.hashCode ^
      icon.hashCode;
}
