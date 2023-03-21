import 'package:flutter/material.dart';

import '../../common/common_colors.dart';
import '../../common/common_custom_field_error_text.dart';
import '../../common/common_text_field_label.dart';
import '../../common/row_with_spacing.dart';

class CustomFieldHorizontalListLayout extends FormField<bool> {
  CustomFieldHorizontalListLayout({
    Key? key,
    required this.label,
    required this.children,
    required FormFieldSetter<bool> onSaved,
    required FormFieldValidator<bool> validator,
    required this.getField,
    bool initialValue = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (field) {
            getField(field);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextFieldLabel(label: label),
                const SizedBox(height: 6),
                Container(
                  decoration: field.hasError
                      ? BoxDecoration(
                          border: Border.all(
                            color: kErrorColor,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        )
                      : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: field.hasError ? 8 : 0,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: RowWithSpacing(
                      spacing: 20,
                      children: children,
                    ),
                  ),
                ),
                if (field.hasError)
                  CommonCustomFieldErrorText(text: field.errorText ?? ''),
              ],
            );
          },
        );

  final String label;
  final List<Widget> children;
  final void Function(FormFieldState) getField;
}
