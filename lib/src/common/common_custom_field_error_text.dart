import 'package:flutter/material.dart';

import 'common_colors.dart';

class CommonCustomFieldErrorText extends StatelessWidget {
  const CommonCustomFieldErrorText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 6, left: 20),
        child: Text(
          text,
          style: const TextStyle(
            color: kErrorColor,
            fontSize: 12,
          ),
        ),
      );
}
