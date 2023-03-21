// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

import '../common_appbar_back_button.dart';
import '../common_colors.dart';
import 'country_selection_theme.dart';
import 'selection_list.dart';
import 'support/code_countries.dart';
import 'support/code_countries_en.dart';
import 'support/code_country.dart';

export 'country_selection_theme.dart';
export 'support/code_country.dart';

class CountryListPick extends StatefulWidget {
  const CountryListPick({
    Key? key,
    this.onChanged,
    this.initialSelection,
    this.appBar,
    this.pickerBuilder,
    this.countryBuilder,
    this.theme,
    this.useUiOverlay = true,
    this.useSafeArea = false,
  }) : super(key: key);

  final String? initialSelection;
  final ValueChanged<CountryCode?>? onChanged;
  final PreferredSizeWidget? appBar;
  final Widget Function(BuildContext context, CountryCode? countryCode)?
      pickerBuilder;
  final CountryTheme? theme;
  final Widget Function(BuildContext context, CountryCode countryCode)?
      countryBuilder;
  final bool useUiOverlay;
  final bool useSafeArea;

  @override
  CountryListPickState createState() {
    List<Map> jsonList =
        theme?.showEnglishName ?? true ? countriesEnglish : codes;

    List elements = jsonList
        .map(
          (s) => CountryCode(
            name: s['name'],
            code: s['code'],
            dialCode: s['dial_code'],
            flagUri: 'assets/flags/${s['code'].toLowerCase()}.png',
          ),
        )
        .toList();
    return CountryListPickState(elements);
  }
}

class CountryListPickState extends State<CountryListPick> {
  CountryCode? selectedItem;
  List elements = [];

  CountryListPickState(this.elements);

  @override
  void initState() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
        (e) =>
            (e.code.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
            (e.dialCode == widget.initialSelection),
        orElse: () => elements[0] as CountryCode,
      );
    } else {
      selectedItem = elements[0];
    }

    super.initState();
  }

  void _awaitFromSelectScreen(
    BuildContext context,
    PreferredSizeWidget? appBar,
    CountryTheme? theme,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionList(
          elements,
          selectedItem,
          appBar: widget.appBar ??
              AppBar(
                backgroundColor: kAppBarBackground,
                title: const Text('Select Country'),
                leading: const CommonAppBarBackButton(),
              ),
          theme: theme,
          countryBuilder: widget.countryBuilder,
          useUiOverlay: widget.useUiOverlay,
          useSafeArea: widget.useSafeArea,
        ),
      ),
    );

    setState(() {
      selectedItem = result ?? selectedItem;
      widget.onChanged!(result ?? selectedItem);
    });
  }

  @override
  Widget build(BuildContext context) => TextButton(
        onPressed: () {
          _awaitFromSelectScreen(context, widget.appBar, widget.theme);
        },
        child: widget.pickerBuilder != null
            ? widget.pickerBuilder!(context, selectedItem)
            : Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (widget.theme?.isShowFlag ?? true == true)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          selectedItem!.flagUri!,
                          width: 32.0,
                        ),
                      ),
                    ),
                  if (widget.theme?.isShowCode ?? true == true)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(selectedItem.toString()),
                      ),
                    ),
                  if (widget.theme?.isShowTitle ?? true == true)
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(selectedItem!.toCountryStringOnly()),
                      ),
                    ),
                  if (widget.theme?.isDownIcon ?? true == true)
                    const Flexible(
                      child: Icon(Icons.keyboard_arrow_down),
                    )
                ],
              ),
      );
}
