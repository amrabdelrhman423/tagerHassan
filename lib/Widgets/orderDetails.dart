import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {

  String imageIcon,title,subtitel;
  bool isUseGoogleMap;

   OrderDetails({Key? key,required this.imageIcon,required this.title,required this.subtitel,this.isUseGoogleMap=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage(imageIcon),
            color: HexColor("#FD8200"),
            size: 18,
          ),
          SizedBox(width: 12,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xff3b3b4d),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
             SizedBox(
               height: 5,
             ),
             isUseGoogleMap?Text(
               'اضغط هنا لإستخدام خرائط جوجل',
               style: TextStyle(
                 fontSize: 18.sp,
                 color: const Color(0xffe4002b),
                 decoration: TextDecoration.underline,
               ),
               textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
               textAlign: TextAlign.right,
             ): Text(
                subtitel,
                style: TextStyle(
                  fontSize: 12.sp,
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
