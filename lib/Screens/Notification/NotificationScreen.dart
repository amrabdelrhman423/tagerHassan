import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Providers/NotificationProvider.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';
import 'package:tagerhasan/Widgets/NotificationItem.dart';

class NotificationSCreen extends StatelessWidget {
  static const routeName="/Notification";
  static  int  notifications=10;

  const NotificationSCreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationsProvider>(
      builder: (context,notificationsProvider,_){
        return Scaffold(
            backgroundColor: Colors.white,
            appBar:CustomAppBar(context,title: 'الإشعارات',actions: true,action:Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 10,left: 20),
              child:  ImageIcon(
                  AssetImage("assets/trash.png"),
              ),
            ),
              fun:()=>notificationsProvider.clearNotification()

            ),

            body:Container(
              child: notificationsProvider.notifications==0?Center(
                child: Text(
                  'لا يوجد اشعارات',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ):ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 5),
                physics: BouncingScrollPhysics(),
                itemCount: notificationsProvider.notifications,
                itemBuilder: (context,index){
                  return NotificationItem(id: index,);
                },
              ),
            )
        );
      },
    );
  }
}
