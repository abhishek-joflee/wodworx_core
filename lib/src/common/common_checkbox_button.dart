import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_colors.dart';
import 'my_size.dart';

/// you need to rebuild this button
/// in order to change the ui for checkbox
class CommonCheckboxButton extends StatelessWidget {
  const CommonCheckboxButton({
    Key? key,
    required this.isSelected,
    required this.onChange,
    required this.label,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  final Widget label;
  final bool isSelected;
  final void Function(bool) onChange;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => CupertinoButton(
        onPressed: () => onChange(!isSelected),
        pressedOpacity: 0.6,
        padding: padding,
        child: Row(
          children: [
            isSelected
                ? Container(
                    decoration: BoxDecoration(
                      color: kBlueColor,
                      border: Border.all(
                        width: 0.5,
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2.5),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 17,
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 0.5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(2.5),
                      child: Icon(
                        Icons.done,
                        color: Colors.transparent,
                        size: 17,
                      ),
                    ),
                  ),

            SizedBox(width: MySize.fromDouble(context, 9)),

            //? label
            label,
          ],
        ),
      );
}
