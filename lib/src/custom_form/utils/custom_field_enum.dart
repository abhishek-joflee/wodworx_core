enum CustomFieldTypes {
  textField(jsonKey: 'text-field'),
  datePicker(jsonKey: 'date-picker'),
  timePicker(jsonKey: 'time-picker'),
  radioGroup(jsonKey: 'radio-group'),
  checkboxGroup(jsonKey: 'checkbox-group'),
  hiddenField(jsonKey: 'hidden-field'),
  countryCodePicker(jsonKey: 'country-code-list'),
  stepCounter(jsonKey: 'step-counter'),
  dropDownList(jsonKey: 'drop-down-list'),
  unknown(jsonKey: ''),
  ;

  // key which comes with json to identify the type
  final String jsonKey;

  const CustomFieldTypes({
    required this.jsonKey,
  });
}

extension CustomFieldUtils on String {
  CustomFieldTypes get customFieldType {
    final data = CustomFieldTypes.values.where((cf) => this == cf.jsonKey);
    return data.isNotEmpty ? data.first : CustomFieldTypes.unknown;
  }
}
