import 'package:flutter/material.dart';
import 'package:tagerhasan/Screens/OrderDetatils/OrderDetailsScreen.dart';
import 'orderDetails.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget buildOrderItem(context){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                OrderDetails( imageIcon:"assets/tag.png" ,title: 'رقم الطلب',subtitel:"#1002" ,),
                SizedBox(
                  width: 70.w,
                ),
                OrderDetails( imageIcon:"assets/scale.png" ,title: ' إجمالي وزن القطع',subtitel:"4 كجم" ,),

                Expanded(child: SizedBox()),

              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                OrderDetails( imageIcon:"assets/city.png" ,title: 'مكان المتجر ',subtitel:"العليا" ,),
                SizedBox(
                  width: 60.w,
                ),
                OrderDetails( imageIcon:"assets/users.png" ,title: 'مكان التوصيل',subtitel:"حطين" ,),

                Expanded(child: SizedBox()),

              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                OrderDetails( imageIcon:"assets/boxes.png" ,title: 'اسم المتجر صاحب البضائع',subtitel:"مكتبة جرير" ,),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 43.h,
                    width: MediaQuery.of(context).size.width*0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xff34cf58),
                    ),

                    child: Center(
                      child: Text(
                            'قبول',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),

                          ),

                    ),
                  ) ,
                  Container(
                    height: 43.h,
                    width: MediaQuery.of(context).size.width*0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: const Color(0xfff54848),
                    ),
                    child: Center(
                      child: Text(
                        'رفض',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                          ),

                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    ),
  );
}