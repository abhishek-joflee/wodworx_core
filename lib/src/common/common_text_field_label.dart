import 'package:flutter/material.dart';

import 'common_colors.dart';

class CommonTextFieldLabel extends StatelessWidget {
  const CommonTextFieldLabel({
    Key? key,
    required this.label,
    this.color = kTextColor,
  }) : super(key: key);

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 16,
        ),
      );
}
