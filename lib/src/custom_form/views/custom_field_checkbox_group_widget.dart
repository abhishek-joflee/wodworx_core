import 'package:flutter/material.dart';

import '../../common/common_checkbox_button.dart';
import '../../common/common_text_field_label.dart';
import '../../common/hex_color_extension.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';
import 'custom_field_horizontal_list_layout.dart';

class CustomFieldCheckboxGroupWidget extends StatefulWidget {
  const CustomFieldCheckboxGroupWidget({
    Key? key,
    required this.customField,
    required this.onChange,
  }) : super(key: key);

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  State<CustomFieldCheckboxGroupWidget> createState() =>
      _CustomFieldCheckboxGroupWidgetState();
}

class _CustomFieldCheckboxGroupWidgetState
    extends State<CustomFieldCheckboxGroupWidget> {
  late List<CustomFieldValue> currentSelection;

  @override
  void initState() {
    super.initState();
    final dvs = widget.customField.defaultValue as List<dynamic>;
    final values = widget.customField.values ?? [];
    currentSelection = values.fromDefaultValues(dvs);
  }

  @override
  Widget build(BuildContext context) {
    FormFieldState? field;
    return CustomFieldHorizontalListLayout(
      getField: (f) => field = f,
      onSaved: (newValue) {},
      validator: (value) {
        if (widget.customField.isRequired) {
          if (currentSelection.isEmpty) {
            return 'Please select at-least one';
          }
        }
        return null;
      },
      label: widget.customField.fieldLabel ?? '',
      children: (widget.customField.values ?? [])
          .map(
            (cfv) => CommonCheckboxButton(
              isSelected: currentSelection.contains(cfv),
              onChange: (selected) {
                //? change the current selection
                setState(() {
                  if (selected) {
                    currentSelection.add(cfv);
                  } else {
                    currentSelection.remove(cfv);
                  }
                  field?.didChange(currentSelection.isEmpty);
                });

                //? update the sendable map
                final newCF = widget.customField.copyWith(
                  defaultValue: currentSelection.valuesToBeSendable,
                );
                widget.onChange(newCF.sendableMap);
              },
              label: CommonTextFieldLabel(
                label: cfv.label ?? '',
                color: HexColor.fromHex(
                  cfv.textColor ?? '#000000',
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
