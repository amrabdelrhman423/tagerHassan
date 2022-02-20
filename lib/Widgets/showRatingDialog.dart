import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Screens/Home/HomeScreen.dart';
Future<void> showMyDialogRate(context, {int? rate, String? review}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,

    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 5),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
          child: Dialog(
            insetPadding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              child:
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height*0.33,
                          child: Column(
                            children: [
                              Text(
                                'مراجعة التقييم',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: const Color(0xff3b3b4d),
                                  fontWeight: FontWeight.w500,
                                ),
                                textHeightBehavior:
                                TextHeightBehavior(applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                ignoreGestures: true,
                                itemCount: 5,
                                itemSize: 40,
                                itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ملاحظات',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xff3b3b4d),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xb2140f26),
                                  fontWeight: FontWeight.w500,
                                ),

                              ),

                              SizedBox(
                                height: 20.h,
                              ),

                              InkWell(
                                onTap: () => Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: const Color(0xfffd8200),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'متابعة',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "tajawalbold"),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )



            ),
          ),
        ),
      );
    },
  );
}
