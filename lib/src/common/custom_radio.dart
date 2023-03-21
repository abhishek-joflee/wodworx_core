import 'package:flutter/material.dart';

import 'common_checkbox_button.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChange,
  }) : super(key: key);

  final T value;
  final T? groupValue;
  final Widget title;
  final void Function(T) onChange;

  @override
  Widget build(BuildContext context) => CommonCheckboxButton(
        isSelected: value == groupValue,
        onChange: (val) => onChange(value),
        label: title,
        padding: const EdgeInsets.symmetric(horizontal: 2),
      );
}
