import 'package:flutter/cupertino.dart';

class IntroProvider extends ChangeNotifier{
   int index=0;

  void nextIntrPage(){
     index++;
     notifyListeners();
   }
}