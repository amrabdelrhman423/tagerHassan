import 'package:flutter/material.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroItem extends StatelessWidget {
  String image,title,subtitle;
  int index;
   IntroItem({Key? key,required this.image,required this.title,required this.subtitle,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 50.sp,
          ),
          index!=2?Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: ()=>Navigator.of(context).pushReplacementNamed(LoginScreen.routeName),
                  child: Text("تخطي",style: TextStyle(
                    color: Colors.grey
                  ),),
                )
              ],
            ),
          ):SizedBox(),
          SizedBox(
            height: 40.sp,
          ),
          Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.4,
              child: Image.asset(image,)),
           SizedBox(
           height: 20.sp,
            ),

        SizedBox(
          height: 40.sp,
            ),
          SizedBox(
            height: 20.sp,
          ),
          Text(title,style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 25.sp,
            fontFamily: "tajawalbold"
          ),),
         const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(subtitle,
            style: TextStyle(
              fontSize: 16.sp,
            ),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
            child: SizedBox(
            ),
          ),
        ],
      ),
    );
  }
}
