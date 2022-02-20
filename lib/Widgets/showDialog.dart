import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Future<void> showMyDialog(context,{String ?text}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 5),
        child: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
          child: Dialog(
            insetPadding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)
            ),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*0.42,
                  child: Column(
                      children: [
                        SizedBox(height: 30.h,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: Image.asset("assets/phonehand.png",scale: 7,),
                        ),
                        SizedBox(height: 30.h,),

                          Container(
                            width: MediaQuery.of(context).size.width*0.67,
                            child: Text(
                              text.toString()=="null"?" ":text.toString(),
                              style: TextStyle(
                                fontSize: 16.5.sp,
                                color: const Color(0xff3b3b4d),
                                fontWeight: FontWeight.w500,
                              ),
                              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        SizedBox(
                          height: 28.h,
                        ),
                        InkWell(
                          onTap: ()=>Navigator.pop(context),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.75,
                            height: 45.h,
                            decoration: BoxDecoration(
                                color: const Color(0xfffd8200),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text(
                                  'متابعة',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xffffffff),
                                    fontWeight: FontWeight.w700,
                                      fontFamily: "tajawalbold"

                                  ),

                                ),

                            ),
                          ),
                        ),
                      ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
