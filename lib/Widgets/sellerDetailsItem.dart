import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerItemDetails extends StatelessWidget {
   SellerItemDetails({Key? key,required this.title,required this.subtitel}) : super(key: key);
  String title,subtitel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff3b3b4d),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.right,
              ),
            SizedBox(
              height: 5,
            ),
            Text(
                subtitel,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: HexColor("#FD8200"),
                  fontWeight: FontWeight.w700
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
