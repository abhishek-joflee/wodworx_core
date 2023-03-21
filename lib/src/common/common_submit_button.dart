import 'package:flutter/material.dart';

import 'common_colors.dart';

class SubmitButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget text;
  final Color color;

  const SubmitButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 44,
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: const BorderSide(color: kLoginButtonBackground),
              ),
            ),
          ),
          child: text,
        ),
      );
}
