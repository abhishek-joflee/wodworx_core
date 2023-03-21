import 'dart:convert';

import 'package:example/custom_form_example.dart';
import 'package:flutter/material.dart';
import 'package:wodworx_core/wodworx_core.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Form Example',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Custom Form Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _loadCustomForm() async {
    final form =
        customFormFromJson(jsonEncode(jsonDecode(dummyRawForm)['data']));
    final data = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CustomFormExample(
          form: form,
        ),
      ),
    );
    if (data != null && context.mounted) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Submitted Data'),
            content: SizedBox(
              height: 250,
              child: SingleChildScrollView(
                child: Text(data.toString()),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Text(
          dummyRawForm,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _loadCustomForm,
        label: const Text('Load this custom form'),
        icon: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}

const dummyRawForm = r'''
{
  "success": true,
  "statusCode": 200,
  "data": {
    "id": "event-form",
    "action": "https://api.wodworx.com/v1.6/event/update?id=187111",
    "fields": [
      {
        "field_type": "text-field",
        "field_label": "Full Name",
        "data_name": "fullName",
        "data_type": "string",
        "is_required": true,
        "placeholder_text": "Your full name",
        "default_value": "Tester Zero Nine",
        "rules": null
      },
      {
        "field_type": "radio-group",
        "field_label": "Gender",
        "data_name": "gender",
        "data_type": "string",
        "is_required": true,
        "show_limit": 100,
        "show_more_label": null,
        "show_less_label": null,
        "default_value": "1",
        "values": [
          {
            "label": "Male",
            "value": "1",
            "text_color": "#000000",
            "bg_color": null,
            "icon": null
          },
          {
            "label": "Female",
            "value": "2",
            "text_color": "#000000",
            "bg_color": null,
            "icon": null
          }
        ]
      },
      {
        "field_type": "text-field",
        "field_label": "Emergency contact name",
        "data_name": "emergencyFullName",
        "data_type": "string",
        "is_required": true,
        "placeholder_text": "Full name",
        "default_value": "Jamil",
        "rules": null
      },
      {
        "field_type": "text-field",
        "field_label": "Emergency contact email",
        "data_name": "emergencyEmail",
        "data_type": "string",
        "is_required": true,
        "placeholder_text": "Email address",
        "default_value": "asasa@yo.com",
        "rules": [
          {
            "regex": "^[a-zA-Z0-9!#$%&'*+\\/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+\\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$",
            "message": "Emergency contact email is a valid email address."
          }
        ]
      },
      {
        "field_type": "drop-down-list",
        "field_label": "Program",
        "data_name": "program_id",
        "data_type": "string",
        "is_required": true,
        "placeholder_text": "Select ...",
        "default_value": "335",
        "values": [
          {
            "label": "BARBELL",
            "value": "23",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#cc0000"
            }
          },
          {
            "label": "BARBELL - PT W LAITH",
            "value": "361",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#e06666"
            }
          },
          {
            "label": "BOXING",
            "value": "523",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#073763"
            }
          },
          {
            "label": "CALLISTHENICS 1",
            "value": "529",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#c27ba0"
            }
          },
          {
            "label": "CROSSFIT",
            "value": "464",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#4a86e8"
            }
          },
          {
            "label": "ELEMENTS",
            "value": "17",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#3c78d8"
            }
          },
          {
            "label": "FUNCTIONAL BB",
            "value": "465",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#f1c232"
            }
          },
          {
            "label": "GLADIATOR",
            "value": "365",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#e69138"
            }
          },
          {
            "label": "MATH ALEVEL PRIVATE",
            "value": "558",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#ffd966"
            }
          },
          {
            "label": "PRE NATAL",
            "value": "525",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#ff00ff"
            }
          },
          {
            "label": "WARRIOR",
            "value": "13",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#4e9131"
            }
          },
          {
            "label": "YOGA",
            "value": "335",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#9900ff"
            }
          },
          {
            "label": "YOGA",
            "value": "509",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#f8cec3"
            }
          },
          {
            "label": "YOGA SCULPT",
            "value": "524",
            "text_color": "#000000",
            "bg_color": null,
            "icon": {
              "url": null,
              "bg_color": "#9900ff"
            }
          }
        ]
      },
      {
        "field_type": "date-picker",
        "field_label": "Start Date",
        "data_name": "startDatePicker",
        "data_type": "string",
        "is_required": true,
        "placeholder_text": "Select ...",
        "default_value": "2023-03-21",
        "rules": [
          {
            "regex": "^\\d{4}\\-(0?[1-9]|1[012])\\-(0?[1-9]|[12][0-9]|3[01])$",
            "message": "Must be a valid date yyyy-mm-dd."
          }
        ]
      },
      {
        "field_type": "time-picker",
        "field_label": "Start time",
        "data_name": "startTimePicker",
        "data_type": "string",
        "is_required": true,
        "placeholder_text": "Select ...",
        "default_value": "9:00 PM",
        "rules": [
          {
            "regex": "^(0[1-9]|1[0-2]):([0-5][0-9]) ((a|p)m|(A|P)M)$",
            "message": "Must be a valid time. Example: 05:30 PM."
          }
        ]
      },
      {
        "field_type": "time-picker",
        "field_label": "End time",
        "data_name": "endTimePicker",
        "data_type": "string",
        "is_required": true,
        "placeholder_text": "Select ...",
        "default_value": "10:00 PM",
        "rules": [
          {
            "regex": "^(0[1-9]|1[0-2]):([0-5][0-9]) ((a|p)m|(A|P)M)$",
            "message": "Must be a valid time. Example: 06:30 PM."
          }
        ]
      },
      {
        "field_type": "radio-group",
        "field_label": "Allow Reservation",
        "data_name": "reservation",
        "data_type": "string",
        "is_required": true,
        "show_limit": 100,
        "show_more_label": null,
        "show_less_label": null,
        "default_value": "1",
        "values": [
          {
            "label": "Yes",
            "value": "1",
            "text_color": "#000000",
            "bg_color": null,
            "icon": null
          },
          {
            "label": "No",
            "value": "0",
            "text_color": "#000000",
            "bg_color": null,
            "icon": null
          }
        ]
      },
      {
        "field_type": "radio-group",
        "field_label": "Allow Cancellation",
        "data_name": "cancellation",
        "data_type": "string",
        "is_required": true,
        "show_limit": 100,
        "show_more_label": null,
        "show_less_label": null,
        "default_value": "1",
        "values": [
          {
            "label": "Yes",
            "value": "1",
            "text_color": "#000000",
            "bg_color": null,
            "icon": null
          },
          {
            "label": "No",
            "value": "0",
            "text_color": "#000000",
            "bg_color": null,
            "icon": null
          }
        ]
      },
      {
        "field_type": "step-counter",
        "field_label": "Limit Capacity",
        "data_name": "capacity",
        "data_type": "integer",
        "is_required": true,
        "placeholder_text": "",
        "default_value": "12",
        "rules": null,
        "min": 1,
        "max": 1000
      }
    ]
  }
}
''';
