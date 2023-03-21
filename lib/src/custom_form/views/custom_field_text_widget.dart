import 'package:flutter/material.dart';

import '../../common/common_colors.dart';
import '../../common/common_text_field_label.dart';
import '../../common/common_validator.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';

class CustomFieldTextWidget extends StatelessWidget {
  const CustomFieldTextWidget({
    Key? key,
    required this.customField,
    required this.onChange,
  }) : super(key: key);

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  Widget build(BuildContext context) {
    final label = customField.fieldLabel ?? '';
    final text = customField.defaultValue;
    final hintText = customField.placeholderText ?? '';
    final rules = customField.rules ?? [];
    final isRequired = customField.isRequired;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CommonTextFieldLabel(label: label),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: text,
          onChanged: (val) => onChange(
            customField.copyWith(defaultValue: val).sendableMap,
          ),
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 16, color: kContentColor),
          validator: (value) => CommonValidator.validateCustomTextField(
            value ?? '',
            rules: rules,
            isRequired: isRequired,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            fillColor: kTextFieldColor,
            filled: true,
            isDense: true,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 1,
                color: kTextFieldBorderColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 1,
                color: kTextFieldActiveBorderColor,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 1,
                color: kErrorColor,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 1,
                color: kErrorColor,
              ),
            ),
            errorStyle: const TextStyle(
              fontSize: 12,
              color: kErrorColor,
            ),
            errorMaxLines: 5,
          ),
        ),
      ],
    );
  }
}
