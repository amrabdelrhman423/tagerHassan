import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';

class TermsAndCondationsScreen extends StatelessWidget {
  static const routeName = "/TermsAndCondation";

  const TermsAndCondationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          context,
          title: "الشروط والأحكام",
          actions: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                for (int i = 0; i < 10; i++)
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '01 ',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color(0xff3b3b4d),
                                  fontWeight: FontWeight.w600),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              'الشروط',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xff3b3b4d),
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.right,
                            ),

                          ],
                        ),
                        SizedBox(
                          height: 12.sp,
                        ),
                        Text(
                          'لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد. كان Lorem Ipsum هو النص الوهمي القياسي في الصناعة منذ القرن الخامس عشر الميلادي ، عندما أخذت طابعة غير معروفة لوحًا من النوع وتدافعت عليه لعمل كتاب عينة.',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: const Color(0xb23b3b4d),
                            fontWeight: FontWeight.w300,
                            height: 1.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
