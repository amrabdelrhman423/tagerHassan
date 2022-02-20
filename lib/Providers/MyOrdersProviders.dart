import 'package:flutter/material.dart';

class MyOrdersProvider extends ChangeNotifier{

String cityFilter="الرياض";

changeCityFilter(String newCity){
  cityFilter=newCity;
  notifyListeners();
}

}