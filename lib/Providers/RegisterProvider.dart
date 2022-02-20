
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier{

int index=0;

void changeindexTab(newindex){

  index=newindex;
  notifyListeners();
}

}