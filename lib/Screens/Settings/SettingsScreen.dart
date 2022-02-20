import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName="/settings";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotification=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context,actions: false,title:"الإعدادات" ),


      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: Text(
                  'الإعدادات العامة',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color(0xff6c7b8a),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageIcon(AssetImage("assets/notification.png"),color: HexColor("#CCCCCC"),),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'الإشعارات',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color(0xff3b3b4d),
                      fontWeight: FontWeight.w500,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),

                  Expanded(child: SizedBox()),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: FlutterSwitch(
                      height: 23.h,
                      width: 47.w,
                      value: isNotification,
                      borderRadius: 30.0,
                      padding: 4.0,
                      inactiveColor:Colors.white ,
                      activeColor:Colors.white,
                      toggleColor:Colors.grey ,
                      activeToggleColor: HexColor("#FD8200"),
                      switchBorder: Border.all(
                          width: 2,
                          color: isNotification?HexColor("#FD8200"):Colors.grey
                      ),
                      onToggle: (val) {
                        setState(() {
                          isNotification = val;
                        });
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Icon(Icons.language_outlined,size: 35,color: HexColor("#CCCCCC"),),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'اللغة',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color(0xff3b3b4d),
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),

                  Expanded(child: SizedBox()),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'العربية',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color(0xff949ea5),
                      ),
                      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
