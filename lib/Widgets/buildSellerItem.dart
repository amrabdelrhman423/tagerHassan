import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Widgets/sellerDetailsItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/enums/statusmatger.dart';
Widget buildSellerItem(context, StatusMatger statu){
  StatusMatger statusMatger=statu;
  String status="";
  Color stateColor=HexColor("#F8B61C");
  if(statu==StatusMatger.active){
    status="مفعل";
    stateColor=HexColor("#21BF46");
  }else if(statu ==StatusMatger.inProgress){
    status="جاري المراجعة";
    stateColor=HexColor("#F8B61C");
  }else{
    status="معطل";
    stateColor=HexColor("#E4002B");
  }
  
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: Text(
                    'عبدالله القحطاني',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: const Color(0xff3b3b4d),
                      fontWeight: FontWeight.w700,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SellerItemDetails(title: 'الطلبات',subtitel:"126" ,),

                    SizedBox(
                      height: 15.h,
                    ),
                    SellerItemDetails( title: 'عمولة إجمالي الطلبات',subtitel:"945 SAR " ,),

                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "حالة المتجر",
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
                                status,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: stateColor,
                                    fontWeight: FontWeight.w700
                                ),
                                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                textAlign: TextAlign.right,
                              )
                            ],


                          ),

                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                    height: 12,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SellerItemDetails( title: 'تاريخ الإضافة',subtitel:"02/06/2021" ,),

                    SizedBox(
                      height: 15.h,
                    ),
                    SellerItemDetails( title: ' عمولة الطلب',subtitel:"0.05%" ,),

                    SizedBox(),

                  ],
                ),
              ],
            ),
SizedBox(
  height: 12,
)
          ],
        ),
      ),
    ),
  );
}