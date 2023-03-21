import 'package:flutter/material.dart';

import '../models/custom_field_model.dart';

class CustomFieldsUnknownWidget extends StatelessWidget {
  const CustomFieldsUnknownWidget({
    Key? key,
    required this.customField,
  }) : super(key: key);

  final CustomField customField;

  @override
  Widget build(BuildContext context) => Text(
        'Unknown field: ${customField.fieldLabel} \nfield_type: ${customField.fieldTypeName}',
      );
}
