import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'common_colors.dart';
import 'common_cupertino_text_button.dart';
import 'search_text_field.dart';

Future<T?> commonDropdownSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> values,
  required List<String> searchableValues,
  required Widget Function(T) builder,
}) async {
  final controller = TextEditingController();
  List<T> valuesCopy = [...values];
  return showCupertinoModalBottomSheet<T>(
    context: context,
    isDismissible: true,
    enableDrag: false,
    builder: (sheetContext) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        body: StatefulBuilder(
          builder: (context, rebuild) {
            void changeHandler(String q) {
              valuesCopy = [];
              for (var i = 0; i < searchableValues.length; i++) {
                if (searchableValues[i]
                    .toLowerCase()
                    .contains(q.toLowerCase())) {
                  valuesCopy.add(values[i]);
                }
              }
              rebuild(() {});
            }

            return Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CommonCupertinoTextButton(
                            onPressed: () => Navigator.pop(sheetContext),
                            text: 'Close',
                            color: kBlueColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: 0,
                    bottom: 15,
                  ),
                  child: SearchTextField(
                    enabled: true,
                    autofocus: false,
                    controller: controller,
                    onCloseTap: () {
                      controller.clear();
                      changeHandler('');
                    },
                    onChangeHandler: changeHandler,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: valuesCopy.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () =>
                          Navigator.pop(sheetContext, valuesCopy[index]),
                      child: builder(
                        valuesCopy[index],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ),
  );
}
