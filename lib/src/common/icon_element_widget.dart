import 'package:flutter/material.dart';

import 'hex_color_extension.dart';

class IconElementWidget extends StatelessWidget {
  const IconElementWidget({
    super.key,
    this.url,
    this.color,
  });

  final String? url;
  final String? color;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    return Container(
      decoration: BoxDecoration(
        color: color == null ? null : HexColor.fromHex(color!),
        borderRadius: borderRadius,
      ),
      height: 20,
      width: 20,
      child: url == null
          ? null
          : ClipRRect(
              borderRadius: borderRadius,
              child: Image(
                image: NetworkImage(
                  url!,
                  scale: 2,
                ),
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
