import 'package:flutter/material.dart';
import 'package:tagerhasan/Screens/OrderDetatils/OrderDetailsScreen.dart';
import 'orderDetails.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Widget buildMyOrderItem(context){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 20),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'عرض المزيد من التفاصيل',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xffb4b4b4),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}