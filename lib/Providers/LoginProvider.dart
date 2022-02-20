import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  TextEditingController controller= TextEditingController();
  bool isSecure=true;

  void changeeyeIcon(){
    isSecure=!isSecure;
    notifyListeners();
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));

  }

}