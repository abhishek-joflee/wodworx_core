import 'package:flutter/material.dart';

import '../../common/common_colors.dart';
import '../../common/common_custom_field_error_text.dart';
import '../../common/common_date_picker.dart';
import '../../common/common_text_field_button.dart';
import '../../common/my_parser.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';

class CustomFieldDatePickerWidget extends StatefulWidget {
  const CustomFieldDatePickerWidget({
    Key? key,
    required this.customField,
    required this.onChange,
  }) : super(key: key);

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  State<CustomFieldDatePickerWidget> createState() =>
      _CustomFieldDatePickerWidgetState();
}

class _CustomFieldDatePickerWidgetState
    extends State<CustomFieldDatePickerWidget> {
  DateTime? date;

  @override
  void initState() {
    super.initState();
    final d = widget.customField.defaultValue as String?;
    date = d == null ? null : DateTime.parse(d);
  }

  @override
  Widget build(BuildContext context) => _DateField(
        label: widget.customField.fieldLabel ?? '',
        text: date == null
            ? widget.customField.placeholderText ?? ''
            : MyParser.dateToYYYYMMDD(date),
        onTap: (field) async {
          final pickedDate = await commonDatePicker(
            context,
            header: widget.customField.fieldLabel ?? '',
            initDate: date,
            doneButtonText: 'Done',
          );
          if (pickedDate != null) {
            final newCf = widget.customField
                .copyWith(defaultValue: MyParser.dateToYYYYMMDD(pickedDate));
            widget.onChange.call(newCf.sendableMap);
            setState(() {
              date = pickedDate;
            });
            field.didChange(date);
          }
        },
        validator: (_) {
          if (widget.customField.isRequired) {
            if (date == null) {
              return 'Please select date';
            }
            return null;
          }
          return null;
        },
      );
}

class _DateField extends FormField<DateTime> {
  _DateField({
    required String label,
    required String text,
    required void Function(FormFieldState<DateTime>) onTap,
    required FormFieldValidator<DateTime> validator,
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
                onTap: () {
                  onTap.call(f);
                },
              ),
              if (f.hasError)
                CommonCustomFieldErrorText(text: f.errorText ?? ''),
            ],
          ),
          validator: validator,
        );
}
