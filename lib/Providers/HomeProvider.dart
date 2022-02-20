
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  int  index=0;
  int  Pageindex=0;
  bool avilable=true;

List<String> titles=[ "الرئيسية"," إشعارات","طلباتي","البائعين","التقارير","الإعدادات","الشروط والأحكام","عن التطبيق","اتصل بنا"," تسجيل خروج"];
List<String> Iconsmenue=["assets/menu/Home.png","assets/menu/Notifications.png","assets/menu/clipboard.png","assets/menu/inventory.png","assets/menu/barchart.png","assets/menu/settings.png","assets/menu/terms-and-conditions.png","assets/menu/question.png","assets/menu/envelope.png","assets/menu/log-out.png"];
String city="الرياض";


changetoAvalibale(val){
  avilable=val;
  notifyListeners();
}
void changeindex(int newIndex){

  index=newIndex;
  notifyListeners();

}

void cityChosse(String ? newcity){
  city=newcity!;
  notifyListeners();
}
void changeSwapeIndex(int newPageindex){
  Pageindex=newPageindex;
  notifyListeners();
}
 bool isopen=false;
     isOpendrawer(val){
        isopen=val;
        notifyListeners();
       }
}