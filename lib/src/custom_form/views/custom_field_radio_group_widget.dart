import 'package:flutter/material.dart';

import '../../common/common_colors.dart';
import '../../common/common_text_field_label.dart';
import '../../common/custom_radio.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';
import 'custom_field_horizontal_list_layout.dart';

class CustomFieldRadioGroupWidget extends StatefulWidget {
  const CustomFieldRadioGroupWidget({
    Key? key,
    required this.customField,
    required this.onChange,
  }) : super(key: key);

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  State<CustomFieldRadioGroupWidget> createState() =>
      _CustomFieldRadioGroupWidgetState();
}

class _CustomFieldRadioGroupWidgetState
    extends State<CustomFieldRadioGroupWidget> {
  late CustomFieldValue? current;

  @override
  void initState() {
    super.initState();
    final dv = widget.customField.defaultValue;
    current = widget.customField.values.fromDefaultValue(dv);
  }

  @override
  Widget build(BuildContext context) {
    FormFieldState? field;
    return CustomFieldHorizontalListLayout(
      getField: (FormFieldState f) => field = f,
      onSaved: (newValue) {},
      validator: (value) {
        if (widget.customField.isRequired) {
          if (current == null) {
            return 'Please select at-least one';
          }
        }
        return null;
      },
      label: widget.customField.fieldLabel ?? '',
      children: (widget.customField.values ?? [])
          .map(
            (cfv) => CustomRadio<CustomFieldValue>(
              value: cfv,
              groupValue: current,
              onChange: (val) {
                setState(() => current = val);
                final newField =
                    widget.customField.copyWith(defaultValue: current?.value);
                widget.onChange(newField.sendableMap);
                field?.didChange(false);
              },
              title: CommonTextFieldLabel(
                label: cfv.label ?? '',
                color: kContentColor,
              ),
            ),
          )
          .toList(),
    );
  }
}
