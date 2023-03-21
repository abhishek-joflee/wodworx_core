import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonCupertinoIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;

  /// default is [Colors.white]
  final Color color;

  /// default is 16
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  /// default is 24
  final double size;
  const CommonCupertinoIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
    this.borderRadius,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FittedBox(
        fit: BoxFit.contain,
        child: CupertinoButton(
          color: backgroundColor,
          borderRadius: borderRadius,
          padding: padding,
          onPressed: onPressed,
          child: Icon(
            icon,
            color: color,
            size: size,
          ),
        ),
      );
}
