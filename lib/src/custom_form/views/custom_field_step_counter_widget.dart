import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/common_checkbox_button.dart';
import '../../common/common_cupertino_icon_button.dart';
import '../../common/common_text_field_label.dart';
import '../models/custom_field_model.dart';
import '../utils/custom_form_extensions.dart';

class CustomFieldStepCounter extends StatefulWidget {
  const CustomFieldStepCounter({
    super.key,
    required this.customField,
    required this.onChange,
  });

  final CustomField customField;
  final void Function(Map<String, dynamic>) onChange;

  @override
  State<CustomFieldStepCounter> createState() => _CustomFieldStepCounterState();
}

class _CustomFieldStepCounterState extends State<CustomFieldStepCounter> {
  bool isSelected = false;
  late int counter;
  late final int min;
  late final int max;
  final disableCounter = -1;

  @override
  void initState() {
    super.initState();
    //? set up variables
    min = widget.customField.min ?? 1;
    max = widget.customField.max ?? 1000;
    counter = min;

    //? check default value
    final i = int.tryParse(
      widget.customField.defaultValue?.toString() ?? '$counter',
    );
    if (i != null) {
      isSelected = i != disableCounter;
      counter = isSelected ? i : counter;
    }
    handleOnChange();
  }

  void handleOnChange() {
    final newCf = widget.customField.copyWith(
      defaultValue: isSelected ? counter : disableCounter,
    );
    widget.onChange(newCf.sendableMap);
  }

  @override
  Widget build(BuildContext context) => _LimitCapacityRowWidget(
        isSelected: isSelected,
        count: counter,
        label: widget.customField.fieldLabel ?? '',
        onChange: (isEnable, count) {
          if (count < min || count > max) return;
          setState(() {
            isSelected = isEnable;
            counter = count;
          });
          handleOnChange();
        },
      );
}

class _LimitCapacityRowWidget extends StatelessWidget {
  const _LimitCapacityRowWidget({
    Key? key,
    required this.onChange,
    required this.isSelected,
    required this.count,
    required this.label,
  }) : super(key: key);

  final bool isSelected;
  final int count;
  final String label;
  final void Function(bool, int) onChange;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          //? checkbox button
          CommonCheckboxButton(
            isSelected: isSelected,
            onChange: (val) {
              onChange.call(val, count);
            },
            label: CommonTextFieldLabel(label: label),
          ),

          //? spacer
          const Spacer(),

          //? minus button
          _CounterButton(
            iconData: CupertinoIcons.minus,
            onPressed:
                isSelected ? () => onChange.call(isSelected, count - 1) : null,
          ),

          //? counter
          Text(
            '$count',
            style: TextStyle(
              fontSize: 16,
              color: !isSelected ? Colors.grey : null,
            ),
          ),

          //? plus button
          _CounterButton(
            iconData: CupertinoIcons.add,
            onPressed:
                isSelected ? () => onChange.call(isSelected, count + 1) : null,
          ),
        ],
      );
}

class _CounterButton extends StatelessWidget {
  const _CounterButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => CommonCupertinoIconButton(
        onPressed: onPressed ?? () {},
        icon: iconData,
        color: onPressed != null ? Colors.black : Colors.grey,
        backgroundColor: Colors.white,
      );
}
