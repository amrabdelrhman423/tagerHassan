import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Screens/AddNewSeller/AddNewSellerScreen.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/buildSellerItem.dart';
import 'package:tagerhasan/enums/statusmatger.dart';

class SellerScreen extends StatelessWidget {
  static const routeName="/SellerScreen";


  const SellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StatusMatger> status=[
      StatusMatger.active,
      StatusMatger.inProgress,
      StatusMatger.stopped,
      StatusMatger.inProgress,
      StatusMatger.stopped,
      StatusMatger.active,
      StatusMatger.inProgress,
      StatusMatger.active,
      StatusMatger.active,
      StatusMatger.active,

    ];
    return Scaffold(
        backgroundColor: HexColor("#F4F6F9"),
        appBar: CustomAppBar(
            context,
            fun: (){
          Navigator.of(context).pushNamed(AddNewSellerScreen.routeName);
        },action: Padding(
          padding: const EdgeInsets.only(top: 28,left: 10),
          child: Text(
            'إضافة جديد',
            style: TextStyle(
              fontFamily: "",
              fontSize: 14.sp,
              color: const Color(0xffffffff),
            ),
            textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.right,
          ),
        ),title:'البائعين' ,actions: true),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
          children: [
            TextFormField(
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                filled: true ,
                fillColor: Colors.white,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: ImageIcon(AssetImage("assets/search.png"),size: 15,),
                ),
                hintText: "البحث عن بائع",
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                hintStyle:TextStyle(
                  fontSize: 17.sp,
                  color: const Color(0x806c7b8a),
                )
              ),
            ),
            for(int index=0;index<10;index++)
            buildSellerItem(context,status[index])
      ],
    ),
        ),
    );
  }
}
