import 'package:flutter/material.dart';
import 'package:wodworx_core/wodworx_core.dart';

class CustomFormExample extends StatelessWidget {
  const CustomFormExample({
    super.key,
    required this.form,
  });

  final CustomFormModel form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: CustomForm(
        form: form,
        onSubmit: (data) => Navigator.pop(context, data),
        submitButtonText: "Submit",
      ),
    );
  }
}
