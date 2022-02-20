import 'package:flutter/material.dart';

class ResetPasswordProvider extends ChangeNotifier{

  bool isSecureOldPassword=true;
  bool isSecureNewPassword=true;
  bool isSecureforConfirmPassword=true;

  void changeeyeIconforOldPassword(){
    isSecureOldPassword=!isSecureOldPassword;
    notifyListeners();
  }


  void changeeyeIconforNewPassword(){
    isSecureNewPassword=!isSecureNewPassword;
    notifyListeners();
  }

  void changeeyeIconforConfirmPassword(){
    isSecureforConfirmPassword=!isSecureforConfirmPassword;
    notifyListeners();
  }

}