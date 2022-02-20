import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class ProfileProvider extends ChangeNotifier{

  String? title;
  String ?decodedPersonalPhoto;

  void pickImage() async {
    try {
      FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        File file = File(result.files.single.path.toString());
        print("File"+file.toString());
        print("result "+ result.toString());
        title = result.files.single.path!;
        List<int> imageBytes = file.readAsBytesSync();
        decodedPersonalPhoto = base64Encode(imageBytes);
        notifyListeners();
      } else {
        // User canceled the picker
      }
    } on Exception catch (e) {
      print("message error " + e.toString());
    }
  }

}