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