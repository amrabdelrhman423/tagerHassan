import 'package:flutter/material.dart';

class NotificationsProvider extends ChangeNotifier{

  int notifications=8;

  void clearNotification(){
    notifications=0;
    notifyListeners();
  }
  void deletNotificationItem(int index){
    notifications--;
    notifyListeners();
  }


}