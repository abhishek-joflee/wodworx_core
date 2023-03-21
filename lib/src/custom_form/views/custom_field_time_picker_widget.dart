import 'package:flutter/cupertino.dart';

import '../../common/common_colors.dart';
import '../../common/common_custom_field_error_text.dart';
import '../../common/common_date_picker.dart';
import '../../common/common_text_field_button.dart';
import '../../common/my_parser.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';

class CustomFieldTimePickerWidget extends StatefulWidget {
  const CustomFieldTimePickerWidget({
    Key? key,
    required this.customField,
    required this.onChange,
  }) : super(key: key);

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  State<CustomFieldTimePickerWidget> createState() =>
      _CustomFieldTimePickerWidgetState();
}

class _CustomFieldTimePickerWidgetState
    extends State<CustomFieldTimePickerWidget> {
  DateTime? time;

  @override
  void initState() {
    super.initState();
    final d = widget.customField.defaultValue as String?;
    time = d == null ? null : MyParser.timeToDate(d);
  }

  @override
  Widget build(BuildContext context) => _TimeField(
        label: widget.customField.fieldLabel ?? '',
        text: time == null
            ? widget.customField.placeholderText ?? ''
            : MyParser.dateToTime(time),
        onTap: (field) async {
          final pickedTime = await commonDatePicker(
            context,
            header: widget.customField.fieldLabel ?? '',
            initDate: time,
            doneButtonText: 'Done',
            mode: CupertinoDatePickerMode.time,
          );
          if (pickedTime != null) {
            final newCf = widget.customField
                .copyWith(defaultValue: MyParser.dateToTime(pickedTime));
            widget.onChange.call(newCf.sendableMap);
            setState(() {
              time = pickedTime;
            });
            field.didChange(time);
          }
        },
        validator: (_) {
          if (widget.customField.isRequired) {
            if (time == null) {
              return 'Please select time';
            }
            return null;
          }
          return null;
        },
      );
}

class _TimeField extends FormField<DateTime> {
  _TimeField({
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
                onTap: () => onTap.call(f),
              ),
              if (f.hasError)
                CommonCustomFieldErrorText(text: f.errorText ?? ''),
            ],
          ),
          validator: validator,
        );
}
