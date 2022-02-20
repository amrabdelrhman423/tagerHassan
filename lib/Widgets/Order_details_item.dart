
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsRow extends StatelessWidget {

  String imageIcon,title,subtitel;
  bool isUseGoogleMap;

  OrderDetailsRow({Key? key,required this.imageIcon,required this.title,required this.subtitel,this.isUseGoogleMap=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Row(
            children: [
              ImageIcon(
                AssetImage(imageIcon),
                color: HexColor("#FD8200"),
                size: 20,
              ),
              SizedBox(width: 8.w,),
             Container(
               width: 133.w,

               child: Text(
                 title,
                 style: TextStyle(
                   fontSize: 14.sp,
                   color: const Color(0xff3b3b4d),
                   fontWeight: FontWeight.w700,
                 ),
                 textAlign: TextAlign.right,
               ),
             ),
              SizedBox(
                width: 8.w,
              ),
              isUseGoogleMap?Text(
                'اضغط لاستخدام الخريطة',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xffe4002b),
                  decoration: TextDecoration.underline,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
              ):
              Text(
                subtitel,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff3b3b4d),
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.right,
              )
            ],

          ),

        ],
      ),
    );
  }
}
