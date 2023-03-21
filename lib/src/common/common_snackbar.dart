import 'package:flutter/material.dart';

abstract class CommonSnackBar {
  // error snackbar
  static custom({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
    required IconData iconData,
    Widget? action,
    EdgeInsetsGeometry? padding,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          behavior: SnackBarBehavior.floating,
          padding: padding,
          content: Row(
            children: [
              Icon(iconData),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              if (action != null) action,
            ],
          ),
          backgroundColor: backgroundColor,
        ),
      );
  }

  static error({
    required BuildContext context,
    required String text,
    Widget? action,
    EdgeInsetsGeometry? padding,
  }) =>
      custom(
        context: context,
        text: text,
        backgroundColor: Colors.red.shade200,
        iconData: Icons.error,
        action: action,
        padding: padding,
      );

  // error snackbar
  static success({
    required BuildContext context,
    required String text,
    Widget? action,
    EdgeInsetsGeometry? padding,
  }) =>
      custom(
        context: context,
        text: text,
        backgroundColor: Colors.green.shade200,
        iconData: Icons.check,
        action: action,
        padding: padding,
      );
}
