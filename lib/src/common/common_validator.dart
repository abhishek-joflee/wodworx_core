import '../custom_form/models/custom_field_model.dart';

class CommonValidator {
  static String? validateCustomTextField(
    String text, {
    required List<CustomFieldRule> rules,
    required bool isRequired,
  }) {
    if (isRequired && text == '') return 'Can not be empty';
    if (text != '') {
      for (final rule in rules) {
        if (rule.regex != null) {
          if (!RegExp(rule.regex!).hasMatch(text)) {
            return rule.message ?? '';
          }
        }
      }
    }
    return null;
  }
}
