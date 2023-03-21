# Wodworx Core

## Usage

```dart
CustomForm(
  form: form,
  onSubmit: (data) => Navigator.pop(context, data),
  submitButtonText: "Submit",
);
```

Here `form` is a type of `CustomFormModel`. You can create it using `customFormFromJson`.

```dart
 final form = customFormFromJson(jsonEncode(jsonDecode(dummyRawForm)['data']));
```

`onSubmit` is callback which will give you the submitted data(`Map<String, dynamic>`) to which is directly sendable to api.
