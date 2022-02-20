import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Screens/OrderDetatils/confirmOrderScreen.dart';
import 'package:tagerhasan/Widgets/Order_details_item.dart';
import 'package:tagerhasan/Widgets/ShowDialogOTP.dart';
import 'package:tagerhasan/Widgets/showDialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routeName="/orderDetails";

   OrderDetailsScreen({Key? key}) : super(key: key);

  List<String> detailstitle=["رقم الطلب","اسم العميل","رقم جوال العميل","مدينة العميل","موقع العميل","اسم التاجر مسؤول الطلب","رقم جوال البائع","مدينة البائع","موقع البائع","تكلفة التوصيل","وسيلة الدفع","إجمالي الطلب","إجمالي وزن القطع","مسافة تواجد المندوب بالنسبة للمتجر","مسافة توصيل السلعة بالنسبة للعميل"];
  List<String> detailsSubtitle=["#1002","عدنان صالح","0540000000","الخرج","اضغط هنا لإستخدام خرائط جوجل","سامر عبدالعزيز","0540000000","الرياض ","اضغط هنا لإستخدام خرائط جوجل","40 ريال","الدفع عند الإستلام","6450 ريال","6450 ريال","5 كم","12 كم"];
  List<String> detailsimagePath=["assets/tag.png","assets/users.png","assets/smartphone.png","assets/users.png","assets/map-flag.png","assets/city.png","assets/smartphone.png","assets/city.png","assets/map-flag.png","assets/cardev.png","assets/credit-card.png","assets/coins.png","assets/coins.png","assets/maps-and-flags.png","assets/maps-and-flags.png"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'تفاصيل الطلب',
          style: TextStyle(
            fontSize: 17.sp,
            color: const Color(0xff140f26),
            fontWeight: FontWeight.w500,
            height: 0.7692307692307693,
          ),
          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),

      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          for(int index=0;index<detailstitle.length;index++)
          index==4||index==8?Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              color: index%2==1?Colors.white:HexColor("#F8F8F8"),
              width: double.infinity,
              height: 47.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                child: Row(
                  children: [
                    OrderDetailsRow( imageIcon:detailsimagePath[index] ,title: detailstitle[index],subtitel:detailsSubtitle[index],isUseGoogleMap: true,),
                  ],
                ),
              ),
            ),
          ):
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
            child: Container(
              color: index%2==1?Colors.white:HexColor("#F8F8F8"),
              width: double.infinity,
              height: 47.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                child: Row(
                  children: [
                    OrderDetailsRow( imageIcon:detailsimagePath[index],title: detailstitle[index],subtitel:detailsSubtitle[index] ,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 15) ,
            child: Row(
              children: [
                Text(
                  'قائمة الطلب',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff3b3b4d),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.right,
                )
              ],
            ),
          ),
          for(int index=0;index<3;index++)
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 8) ,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 55.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: const AssetImage('assets/1.png'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(width: 2.0, color: const Color(0xfff3f4f5)),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '2x',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: const Color(0x803b3b4d),
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    'Sony Wireless Headphone , Black - WH-1000XM3B\n',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: const Color(0xff3b3b4d),
                      height: 1.3333333333333333,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 0) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Adobe XD layer: 'bg' (shape)
                Container(
                  width: 113.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xfff54848),
                  ),
                  child: Center(

                        child: Text(
                          'إلغاء',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: (){
                    showDialogOTP(context).then((value) => {
                      showMyDialog(context,text: "لقد أدخلت رمزًا غير صالح ولا يمكنك استلام الطلب").then((value) => Navigator.pushReplacementNamed(context, ConfirmOrderScreen.routeName))
                    });
                  },
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 0.sp,vertical: 10.sp),
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xfffd8200),
                      ),
                      child: Center(
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'تأكيد الوصول إلى البائع',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
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

    );
  }
}
