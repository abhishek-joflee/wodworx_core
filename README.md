# Wodworx Core

A supporting core library for all the wodworx applications.

## Features

- Currently `CustomForm` is the only feature added to this package.

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

`onSubmit` is callback which will give you the submitted data(`Map<String, dynamic>`) which is directly sendable to api.

-             |  -
:-------------------------:|:-------------------------:
![Screenshot 2023-03-21 at 3 46 26 PM](https://user-images.githubusercontent.com/90181186/226578174-f37d82fc-6f1f-4672-8d32-5ccc24ce8c5f.png)  |  ![Screenshot 2023-03-21 at 3 46 20 PM](https://user-images.githubusercontent.com/90181186/226578202-af51727b-4360-4299-b7af-5562c5fb4615.png)
