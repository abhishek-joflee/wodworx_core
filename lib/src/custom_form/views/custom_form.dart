import 'package:flutter/material.dart';

import '../../common/common_colors.dart';
import '../../common/common_snackbar.dart';
import '../../common/common_submit_button.dart';
import '../models/custom_form_model.dart';
import '../utils/custom_form_extensions.dart';
import 'custom_field_widget.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({
    Key? key,
    required this.form,
    required this.onSubmit,
    required this.submitButtonText,
    this.bottomPadding = 20,
  }) : super(key: key);

  final CustomFormModel form;
  final void Function(Map<String, dynamic>) onSubmit;
  final String submitButtonText;
  final double bottomPadding;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late Map<String, dynamic> currentForm;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    currentForm = widget.form.sendableMap;
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: widget.bottomPadding,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //? form
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: widget.form.fields!.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      itemBuilder: (context, index) {
                        final cf = widget.form.fields![index];
                        return CustomFieldWidget(
                          customField: cf,
                          onChange: currentForm.addAll,
                        );
                      },
                    ),
                  ),
                ),

                //? update button
                const SizedBox(height: 12),
                SubmitButton(
                  color: kLoginButtonBackground,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.onSubmit(currentForm);
                      return;
                    }
                    CommonSnackBar.error(
                      context: context,
                      text: 'Please correct the details',
                    );
                  },
                  text: Text(
                    widget.submitButtonText,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
