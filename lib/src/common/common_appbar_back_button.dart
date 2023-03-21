import 'package:flutter/cupertino.dart';

import 'common_cupertino_icon_button.dart';

class CommonAppBarBackButton extends StatelessWidget {
  const CommonAppBarBackButton({
    super.key,
    this.iconSize = 24,
  });

  final double iconSize;

  @override
  Widget build(BuildContext context) => CommonCupertinoIconButton(
        onPressed: () => Navigator.pop(context),
        icon: CupertinoIcons.back,
        size: iconSize,
      );
}
