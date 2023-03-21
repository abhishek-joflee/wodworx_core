import 'package:flutter/material.dart';

import '../../common/common_colors.dart';
import '../../common/common_custom_field_error_text.dart';
import '../../common/common_text_field_button.dart';
import '../../common/countryPicker/country_code_widget.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';

class CustomFieldCountryCodePicker extends StatefulWidget {
  const CustomFieldCountryCodePicker({
    super.key,
    required this.customField,
    required this.onChange,
  });

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  State<CustomFieldCountryCodePicker> createState() =>
      _CustomFieldCountryCodePickerState();
}

class _CustomFieldCountryCodePickerState
    extends State<CustomFieldCountryCodePicker> {
  //? state variable
  String countryCode = '+962';

  @override
  void initState() {
    if (widget.customField.defaultValue != null) {
      countryCode = widget.customField.defaultValue;
    }
    handleOnChange(countryCode);
    super.initState();
  }

  void handleOnChange(String code) {
    countryCode = code;
    final c = countryCode.replaceAll('+', '');
    final newCf = widget.customField.copyWith(defaultValue: c).sendableMap;
    widget.onChange.call(newCf);
  }

  @override
  Widget build(BuildContext context) => _CodePicker(
        label: widget.customField.fieldLabel ?? '',
        onChange: handleOnChange,
        initialSelection: countryCode,
      );
}

class _CodePicker extends FormField<int> {
  _CodePicker({
    required String label,
    required void Function(String) onChange,
    required String initialSelection,
  }) : super(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (f) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextFieldButton(
                label: label,
                text: '',
                border: f.hasError ? Border.all(color: kErrorColor) : null,
                onTap: () {},
                child: SizedBox(
                  width: double.infinity,
                  child: CountryCodeWidget(
                    onChanged: (val) {
                      if (val != null && val.dialCode != null) {
                        onChange(val.dialCode!);
                      }
                    },
                    initialSelection: initialSelection,
                  ),
                ),
              ),
              if (f.hasError)
                CommonCustomFieldErrorText(text: f.errorText ?? ''),
            ],
          ),
        );
}
