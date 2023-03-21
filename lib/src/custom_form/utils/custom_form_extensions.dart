import '../models/custom_field_model.dart';
import '../models/custom_form_model.dart';

extension CustomFieldExtensions on CustomField {
  /// ```
  /// {'gender': 1}
  /// ```
  Map<String, dynamic> get sendableMap {
    if (dataName != null) {
      return {dataName!: defaultValue};
    }
    return {};
  }
}

extension ListOfCustomFieldValuesExtensions on List<CustomFieldValue>? {
  /// for radio group
  /// return CustomFieldValue which has
  /// ```
  /// value == defaultValue
  /// ```
  CustomFieldValue? fromDefaultValue(dynamic defaultValue) {
    if (this?.isNotEmpty ?? false) {
      for (final cfv in this!) {
        if (cfv.value == defaultValue) {
          return cfv;
        }
      }
    }
    return null;
  }

  /// for checkbox group
  List<CustomFieldValue> fromDefaultValues(List<dynamic> defaultValues) {
    List<CustomFieldValue> result = [];
    if (this?.isNotEmpty ?? false) {
      for (final cfv in this!) {
        if (defaultValues.contains(cfv.value)) {
          result.add(cfv);
        }
      }
    }
    return result;
  }

  /// for checkbox group
  /// returns List<dynamic> sendable map for the current selection checkbox
  List<dynamic> get valuesToBeSendable {
    if (this?.isNotEmpty ?? false) {
      return this!.map((cfv) => cfv.value).toList();
    }
    return [];
  }
}

extension CustomFormModelExtensions on CustomFormModel {
  /// result of all the custom fields default value
  ///```
  /// {
  ///   'gender': 1,
  ///   'fullName': 'Tester ZeroNine',
  ///   ...
  /// }
  /// ```
  Map<String, dynamic> get sendableMap {
    Map<String, dynamic> result = {};
    fields?.forEach((cf) => result.addAll(cf.sendableMap));
    return result;
  }
}
