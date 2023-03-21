import 'package:flutter/material.dart';

import '../models/custom_field_model.dart';

class CustomFieldHiddenWidget extends StatelessWidget {
  const CustomFieldHiddenWidget({
    super.key,
    required this.customField,
  });

  final CustomField customField;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
