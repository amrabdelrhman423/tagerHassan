import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 CustomAppBar(context, {void Function()? fun, String? title,bool ?actions,Widget?action}){
  return PreferredSize(
    preferredSize: Size.fromHeight(55.h), // here the desired height
    child:  AppBar(
        backgroundColor: HexColor("#FD8200"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        actions: [
          actions!?InkWell(
            onTap: fun!,
            child:  action
          ):SizedBox()
        ],
        title: Padding(
          padding:  EdgeInsets.only(top: 22),
          child: Text(
            title.toString(),
            style: TextStyle(
              fontFamily: "",
              fontSize: 14.5.sp,
              color:  Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),

          ),
        ),

      ),

  );
}