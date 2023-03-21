import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'common_colors.dart';
import 'common_cupertino_text_button.dart';
import 'common_text_field_label.dart';
import 'my_parser.dart';

Future<DateTime?> commonDatePicker(
  BuildContext context, {
  required String header,
  String? doneButtonText,
  required DateTime? initDate,
  CupertinoDatePickerMode? mode,
}) async =>
    showCupertinoModalBottomSheet<DateTime>(
      useRootNavigator: true,
      context: context,
      builder: (sheetContext) => _MyDatePicker(
        header: header,
        currentDate: initDate ?? DateTime.now(),
        onDateSelect: (newDate) => Navigator.pop(sheetContext, newDate),
        doneButtonText: doneButtonText,
        cupertinoDatePickerMode: mode ?? CupertinoDatePickerMode.date,
      ),
    );

class _MyDatePicker extends StatefulWidget {
  const _MyDatePicker({
    Key? key,
    required this.onDateSelect,
    required this.currentDate,
    required this.header,
    this.doneButtonText,
    required this.cupertinoDatePickerMode,
  }) : super(key: key);

  final String header;
  final String? doneButtonText;
  final void Function(DateTime) onDateSelect;
  final DateTime currentDate;
  final CupertinoDatePickerMode cupertinoDatePickerMode;

  @override
  State<_MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<_MyDatePicker> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.currentDate;
  }

  @override
  Widget build(BuildContext context) => Material(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: <Widget>[
                  CommonTextFieldLabel(label: widget.header),
                  const Spacer(),
                  CommonCupertinoTextButton(
                    onPressed: () => widget.onDateSelect.call(selectedDate),
                    text: widget.doneButtonText ??
                        MyParser.dateToMDY(selectedDate),
                    color: kBlueColor,
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.32,
              child: CupertinoDatePicker(
                initialDateTime: selectedDate,
                onDateTimeChanged: (date) {
                  setState(() => selectedDate = date);
                },
                mode: widget.cupertinoDatePickerMode,
              ),
            ),
          ],
        ),
      );
}
