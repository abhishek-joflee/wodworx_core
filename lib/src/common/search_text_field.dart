import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final bool enabled;
  final bool autofocus;
  final void Function(String)? onChangeHandler;
  final TextEditingController? controller;
  final void Function()? onCloseTap;
  final FocusNode? focusNode;
  final String hintText;

  const SearchTextField({
    Key? key,
    required this.enabled,
    this.autofocus = true,
    this.onChangeHandler,
    this.controller,
    this.onCloseTap,
    this.focusNode,
    this.hintText = 'Type to show more results...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 238, 238),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Icon(
                CupertinoIcons.search,
                size: 20,
                color: Color.fromRGBO(84, 84, 84, 1),
              ),
            ),
            Expanded(
              child: TextField(
                enabled: enabled,
                autofocus: autofocus,
                focusNode: focusNode,
                showCursor: enabled,
                onChanged: onChangeHandler,
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: hintText,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  suffix: !enabled
                      ? null
                      : CupertinoButton(
                          minSize: 0,
                          padding: const EdgeInsets.only(right: 8),
                          onPressed: onCloseTap,
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  Colors.grey, // material color will cover this
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      );
}
