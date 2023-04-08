# (20) Praktikum Flutter State Management (Provider)

#### Table of Content
1. [Flutter Provider - Contact](https://github.com/ikhsan34/flutter_muhamad-ikhsan-firdaus/edit/main/20_Flutter%20State%20Management%20(Provider)/praktikum/README.md#flutter-create-contact--state-management-menggunakan-provider)
2. [Flutter Provider - Gallery](https://github.com/ikhsan34/flutter_muhamad-ikhsan-firdaus/edit/main/20_Flutter%20State%20Management%20(Provider)/praktikum/README.md#flutter-gallery--state-management-menggunakan-provider)


## Flutter Create Contact & State Management Menggunakan Provider
### Tampilan Dashboard
Pada dashboard terdapat list contacts.

<img src="https://user-images.githubusercontent.com/10411833/229635812-541998f6-deef-4aec-816b-f4fbca78f553.png" height=600>

### Tampilan Create Contact
Create contact terdapat form untuk nama dan form untuk nomor telepon.

<img src="https://user-images.githubusercontent.com/10411833/229636230-45d35c06-3cb9-4e3a-b19a-deb19ec15bd8.png" height=600>

### Hasil Create Contact

<img src="https://user-images.githubusercontent.com/10411833/229636413-4d50eb0b-ab97-46e1-bb9b-ae5348b351f3.png" height=600>


### Pembuatan Provider

![Create Provider](https://user-images.githubusercontent.com/10411833/229636501-22c7c0f6-fce9-42d7-afc6-594a9de24443.png)

### Class yang Digunakan pada Provider

![Class Provider](https://user-images.githubusercontent.com/10411833/229636599-c003532e-812e-4097-bee2-ec89b43ae0d2.png)


### Create Contact Function

![Create Contact Function](https://user-images.githubusercontent.com/10411833/229636546-21ad3faf-9bab-49ee-ad44-b49e252c2ad6.png)

### Remove Function

![Remove Contact Button](https://user-images.githubusercontent.com/10411833/229636624-e1e16e48-38fe-4164-87fc-dcaec2e30537.png)


## Flutter Gallery & State Management Menggunakan Provider

### Dashboard
<img src="https://user-images.githubusercontent.com/10411833/230733368-728d5e02-931a-45b3-a6d7-e42d36864e59.png" height=600>

### Pick Image File
<img src="https://user-images.githubusercontent.com/10411833/230733379-eb16b620-b22c-4dd3-9f86-b0aed8d3b90a.png" height=600>

### Detail Image
<img src="https://user-images.githubusercontent.com/10411833/230733381-713ffa4a-9051-4e83-9ccd-ccb6ac4f5643.png" height=600>

### Image Provider
<img src="https://user-images.githubusercontent.com/10411833/230733391-0ecf3255-b226-45f9-96ae-e2cca1f6d724.png" height=300>

```dart
import 'dart:io';

import 'package:file_picker_provider/models/image_model.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ImageProvider extends ChangeNotifier {

  List<ImageModel> _images = [];
  List<ImageModel> get images => _images;

  void addImage() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      final file = result.files.single;
      _images.add(ImageModel(name: file.name, path: file.path!, file: File(file.path!)));
      notifyListeners();
    }

  }

  void removeImage(int index) {
    _images.removeAt(index);
    notifyListeners();
  }

}
```

### Transition Animation Using SlideTransition
![Transition Gif](https://user-images.githubusercontent.com/10411833/230733508-5ea9caad-3c3a-41ae-82ac-4f20ce838040.gif)



























