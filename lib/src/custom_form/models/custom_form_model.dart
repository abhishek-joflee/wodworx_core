import 'dart:convert';

import 'custom_field_model.dart';

CustomFormModel customFormFromJson(String str) =>
    CustomFormModel.fromJson(json.decode(str));

String customFormToJson(CustomFormModel data) => json.encode(data.toJson());

class CustomFormModel {
  CustomFormModel({
    this.id,
    this.action,
    this.fields,
  });

  final String? id;
  final String? action;
  final List<CustomField>? fields;

  factory CustomFormModel.fromJson(Map<String, dynamic> jsonData) =>
      CustomFormModel(
        id: jsonData['id'],
        action: jsonData['action'],
        fields: jsonData['fields'] == null
            ? null
            : customFieldListFromJson(json.encode(jsonData['fields'])),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'action': action,
        'fields': fields == null ? null : customFieldListToJson(fields!),
      };
}
