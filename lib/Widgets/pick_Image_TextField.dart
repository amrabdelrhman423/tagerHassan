
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';

class PickImageTextField extends StatefulWidget {
  final String ?hint;
  final Function? onImagePicked;

  const PickImageTextField(
      {Key? key, this.hint, this.onImagePicked})
      : super(key: key);

  @override
  _PickImageTextFieldState createState() => _PickImageTextFieldState();
}

class _PickImageTextFieldState extends State<PickImageTextField> {
  String _title="";

   _pickImage() async {
    try {
      FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        File file = File(result.files.single.path!);
        widget.onImagePicked!(file);
        print(result.files.first.name);
        setState(() {
          _title = result.files.first.name;
        });
      } else {
        // User canceled the picker
      }
    } on Exception catch (e) {
      print("message error " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingupTextForm(
      hintText: _title,
     // value: _title,
      onTap: _pickImage,
      textInputType: TextInputType.text,
      suffixIcon: Icon(Icons.camera_alt_outlined,color: HexColor("#9B9B9B"),),
      readOnly: true,
      validator: (val){
        if(_title.isEmpty){
          return "يجب عليك اختيار صورة ";
        }else
          return null;
      },
    );
  }
}
