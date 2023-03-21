import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonCupertinoTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final FontWeight? fontWeight;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double? fontSize;

  const CommonCupertinoTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.contain,
        child: CupertinoButton(
          padding: padding,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: color,
              letterSpacing: 0.2,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      );
}
