import 'package:flutter/material.dart';

import '../models/custom_field_model.dart';
import '../utils/custom_field_enum.dart';
import 'custom_field_checkbox_group_widget.dart';
import 'custom_field_country_code_picker.dart';
import 'custom_field_date_picker_widget.dart';
import 'custom_field_dropdown_list_widget.dart';
import 'custom_field_hidden_widget.dart';
import 'custom_field_radio_group_widget.dart';
import 'custom_field_step_counter_widget.dart';
import 'custom_field_text_widget.dart';
import 'custom_field_time_picker_widget.dart';
import 'custom_fields_unknown_widget.dart';

class CustomFieldWidget extends StatelessWidget {
  const CustomFieldWidget({
    Key? key,
    required this.customField,
    required this.onChange,
  }) : super(key: key);

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  Widget build(BuildContext context) {
    switch (customField.fieldType) {
      //? text-field
      case CustomFieldTypes.textField:
        return CustomFieldTextWidget(
          customField: customField,
          onChange: onChange,
        );

      //? date-picker
      case CustomFieldTypes.datePicker:
        return CustomFieldDatePickerWidget(
          customField: customField,
          onChange: onChange,
        );

      //? time-picker
      case CustomFieldTypes.timePicker:
        return CustomFieldTimePickerWidget(
          customField: customField,
          onChange: onChange,
        );

      //? radio-group
      case CustomFieldTypes.radioGroup:
        return CustomFieldRadioGroupWidget(
          customField: customField,
          onChange: onChange,
        );

      //? checkbox-group
      case CustomFieldTypes.checkboxGroup:
        return CustomFieldCheckboxGroupWidget(
          customField: customField,
          onChange: onChange,
        );

      case CustomFieldTypes.countryCodePicker:
        return CustomFieldCountryCodePicker(
          customField: customField,
          onChange: onChange,
        );

      //? step-counter
      case CustomFieldTypes.stepCounter:
        return CustomFieldStepCounter(
          customField: customField,
          onChange: onChange,
        );

      //? drop-down-list
      case CustomFieldTypes.dropDownList:
        return CustomFieldDropDownListWidget(
          customField: customField,
          onChange: onChange,
        );

      //? hidden-field
      case CustomFieldTypes.hiddenField:
        return CustomFieldHiddenWidget(
          customField: customField,
        );

      //? unknown
      case CustomFieldTypes.unknown:
        return CustomFieldsUnknownWidget(
          customField: customField,
        );
    }
  }
}
