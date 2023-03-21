import 'package:flutter/material.dart';

import 'common_colors.dart';
import 'common_text_field_label.dart';

class CommonTextFieldButton extends StatelessWidget {
  const CommonTextFieldButton({
    Key? key,
    required this.label,
    required this.text,
    required this.onTap,
    this.border,
    this.child,
  }) : super(key: key);

  final String label;
  final String text;
  final VoidCallback onTap;
  final BoxBorder? border;
  final Widget? child;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CommonTextFieldLabel(label: label),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kTextFieldColor,
                borderRadius: BorderRadius.circular(12),
                border: border,
              ),
              child: child ??
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12,
                    ),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: kContentColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
            ),
          ),
        ],
      );
}
