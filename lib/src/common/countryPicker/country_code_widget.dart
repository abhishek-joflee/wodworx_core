import 'package:flutter/material.dart';

import '../common_colors.dart';
import 'country_list_pick.dart';

class CountryCodeWidget extends StatelessWidget {
  const CountryCodeWidget({
    Key? key,
    required this.onChanged,
    required this.initialSelection,
  }) : super(key: key);

  final void Function(CountryCode?) onChanged;
  final String initialSelection;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        decoration: BoxDecoration(
          color: kTextFieldColor,
          border: Border.all(width: 1, color: kTextFieldBorderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: CountryListPick(
          pickerBuilder: (context, CountryCode? countryCode) => Row(
            children: [
              Image.asset(
                countryCode?.flagUri ?? '',
              ),
              const SizedBox(width: 20),
              Text(
                countryCode?.dialCode ?? '',
                style: const TextStyle(
                  color: kContentColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                countryCode?.name ?? '',
                style: const TextStyle(
                  color: kContentColor,
                ),
              ),
            ],
          ),
          useUiOverlay: true,
          theme: CountryTheme(
            isShowFlag: true,
            isShowTitle: true,
            isShowCode: true,
            isDownIcon: true,
            showEnglishName: true,
            labelColor: Colors.blueAccent,
          ),
          initialSelection: initialSelection,
          onChanged: onChanged,
        ),
      );
}
