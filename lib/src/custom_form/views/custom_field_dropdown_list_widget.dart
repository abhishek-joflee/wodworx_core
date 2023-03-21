import 'package:flutter/material.dart';

import '../../common/common_colors.dart';
import '../../common/common_custom_field_error_text.dart';
import '../../common/common_dropdown_sheet.dart';
import '../../common/common_text_field_button.dart';
import '../../common/icon_element_widget.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';

class CustomFieldDropDownListWidget extends StatefulWidget {
  const CustomFieldDropDownListWidget({
    super.key,
    required this.customField,
    required this.onChange,
  });

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  State<CustomFieldDropDownListWidget> createState() =>
      _CustomFieldDropDownListWidgetState();
}

class _CustomFieldDropDownListWidgetState
    extends State<CustomFieldDropDownListWidget> {
  CustomFieldValue? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.customField.values
        .fromDefaultValue(widget.customField.defaultValue);
  }

  void handleOnChange(CustomFieldValue val) {
    setState(() {
      selected = val;
    });
    final newCf = widget.customField.copyWith(defaultValue: selected?.value);
    widget.onChange(newCf.sendableMap);
  }

  @override
  Widget build(BuildContext context) => _DropDown(
        label: widget.customField.fieldLabel ?? '',
        text: selected == null
            ? (widget.customField.placeholderText ?? '')
            : (selected!.label ?? ''),
        onTap: (field) async {
          final val = await commonDropdownSheet<CustomFieldValue>(
            context: context,
            title: widget.customField.fieldLabel ?? '',
            values: widget.customField.values ?? [],
            searchableValues: (widget.customField.values ?? [])
                .map((e) => e.label ?? '')
                .toList(),
            builder: (val) => ListTile(
              horizontalTitleGap: 0,
              leading: IconElementWidget(
                color: val.icon?.bgColor,
                url: val.icon?.url,
              ),
              title: Text(val.label ?? ''),
            ),
          );
          if (val != null) {
            handleOnChange(val);
            field.didChange(selected);
          }
        },
        validator: (_) {
          if (widget.customField.isRequired) {
            if (selected == null) {
              return 'Please select value';
            }
            return null;
          }
          return null;
        },
      );
}

class _DropDown extends FormField<CustomFieldValue> {
  _DropDown({
    required String label,
    required String text,
    required void Function(FormFieldState<CustomFieldValue>) onTap,
    required FormFieldValidator<CustomFieldValue> validator,
  }) : super(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (f) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFieldButton(
                label: label,
                text: text,
                border: f.hasError ? Border.all(color: kErrorColor) : null,
                onTap: () => onTap.call(f),
              ),
              if (f.hasError)
                CommonCustomFieldErrorText(text: f.errorText ?? ''),
            ],
          ),
          validator: validator,
        );
}
