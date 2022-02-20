import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Providers/ProfileProvider.dart';
import 'package:tagerhasan/Screens/ScreenPhoto.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';
import 'package:tagerhasan/Screens/auth/ResetPassword/ResetPasswordScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';
import 'package:tagerhasan/Widgets/showDialogWithoutbuttons.dart';
import 'package:tagerhasan/Widgets/showdialogdeletAcount.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/ProfileScreen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

enum DetailsData { carDetails, bankDetails, PersonalDetails }

class _ProfileScreenState extends State<ProfileScreen> {
  var currentIndexprofile;
  var currentIndexcar;
  var currentIndexbank;
  bool save = false;
  FocusNode focusnode = FocusNode();

  List personaltitels = [
    'اسمك الأول',
    "اسمك الثاني",
    "اسم العائلة",
    "رقم الجوال",
    "البريد الإلكتروني",
    "تاريخ الميلاد ",
    "المدينة",
    "الجنسية",
    "رقم الهوية الوطنية",
    "صورة الهوية سارية المفعول"
  ];
  List personalvalues = [
    "محمد ",
    "صالح",
    "محمد",
    "0540000000",
    "mohamed.salah@gmail.com",
    "01/01/1990",
    "الرياض",
    "السعودية",
    "0000000000",
    "اضغط هنا لعرض الصورة"
  ];
  List cartitels = [
    "نوع السيارة",
    "رقم الهيكل ",
    "ماركة المركبة",
    "طراز المركبة",
    "سنة التصنيع",
    "رقم اللوحة",
    "رخصة السير"
  ];
  List carvalues = [
    "KIA",
    "LAJDKAKHA5484DTA",
    "KIA",
    "سيدان",
    "2015",
    "DFG 1258",
    "اضغط هنا لعرض الصورة"
  ];
  List banktitels = [
    "اسم البنك",
    "اسم صاحب الحساب",
    "رقم الايبان",
    "رقم الحساب",
  ];
  List bankvalues = [
    "مصرف الراجحي",
    "محمد صالح محمد",
    "00000000000000",
    "00000000000"
  ];

  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
    //  resizeToAvoidBottomInset: false,

      backgroundColor: HexColor("#F4F6F9"),
      appBar: CustomAppBar(context,
          actions: save,
          action: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Text(
              'حفظ',
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w500,
                height: 0.7407407407407407,
              ),
            ),
          ),
          fun: () => showDialogWithoutbuttons(context,
              text:
                  'التعديل علي بيانات الملف الشخصي قيد المراجعة من قبل الإدارة لتأكيد التعديل'),
          title: "الملف الشخصي"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:  Column(
          children: [

            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => profileProvider.pickImage(),
                  child: profileProvider.title!=null
                      ? CircleAvatar(
                    backgroundImage:
                    FileImage(File(profileProvider.title!)),
                    radius: 80,
                    backgroundColor: Colors.transparent,
                  )
                      : CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/profile.png"),
                    radius: 80,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'البيانات الشخصية',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff3b3b4d),
                      fontWeight: FontWeight.w700,
                    ),

                  )
                ],
              ),
            ),

            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: personaltitels.length,
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.5),
                child: detailsProfile(
                    personaltitels[index],
                    personalvalues[index],
                    index == personalvalues.length - 1,
                    index,
                    DetailsData.PersonalDetails),
              ),
            ),


            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    ' بيانات السيارة',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff3b3b4d),
                      fontWeight: FontWeight.w700,
                      height: 1.3928571428571428,
                    ),
                    textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartitels.length,
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.5),
                child: detailsProfile(
                    cartitels[index],
                    carvalues[index],
                    index == cartitels.length - 1,
                    index,
                    DetailsData.carDetails),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'بيانات الحساب البنكي',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff3b3b4d),
                      fontWeight: FontWeight.w700,
                      height: 1.3928571428571428,
                    ),
                    textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: banktitels.length,
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0.5),
                child: detailsProfile(
                    banktitels[index],
                    bankvalues[index],
                    false,
                    index,
                    DetailsData.bankDetails),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            Container(
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Image.asset("assets/verify.png",
                        scale: 5.1, color: HexColor("#140F26")),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'تاريخ الإنضمام 14/10/2020',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff140f26),
                        fontWeight: FontWeight.w500,
                      ),
                      textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .pushNamed(ResetPasswordScreen.routeName),
              child: Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/padlock.png",
                        scale: 2,
                        color: HexColor("#140F26"),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'تغيير كلمة المرور',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xff140f26),
                          fontWeight: FontWeight.w500,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName, (route) => false),
              child: Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/menu/log-out.png",
                        color: HexColor("#140F26"),
                        scale: 5.2,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: HexColor("#D84242"),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () => showdialogdeletAcount(context,
                  text:
                  'حذفك للحساب يؤدي إلى تصفية المحفظة الخاصة بك وحذف جميع بياناتك وإمتيازاتك'),
              child: Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/rubbish.png",
                        scale: 5,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'حذف الحساب',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: const Color(0xffb4b4b4),
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget detailsProfile(
      String title, String subTitle, bool photo, int index, DetailsData data) {
    bool readOnly;
    if (data == DetailsData.carDetails) {
      readOnly = index != currentIndexcar;
    } else if (data == DetailsData.PersonalDetails) {
      readOnly = index != currentIndexprofile;
    } else {
      readOnly = index != currentIndexbank;
    }
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        children: [
          Container(
            width: 89.w,
            padding: EdgeInsets.symmetric(vertical: 6.sp),
            child: Text(
              title,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff949ea5),
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
          ),
          photo
              ? Expanded(
                  child: InkWell(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenPhoto(),)),
                    child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'اضغط هنا لعرض الصورة',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xffe4002b),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),

                        )),
                  ),
                )
              : Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextFormField(
                        enabled: true,
                        focusNode: focusnode,
                        readOnly: readOnly,
                        textInputAction: TextInputAction.done,
                        initialValue: subTitle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )),
                ),
          InkWell(
              onTap: () {
                setState(() {
                  if (data == DetailsData.PersonalDetails) {
                    currentIndexprofile = index;
                    currentIndexbank = null;
                    currentIndexcar = null;
                  } else if (data == DetailsData.carDetails) {
                    currentIndexcar = index;
                    currentIndexbank = null;
                    currentIndexprofile = null;
                  } else {
                    currentIndexbank = index;
                    currentIndexprofile = null;
                    currentIndexcar = null;
                  }
                  save = true;
                });
                focusnode.requestFocus();

              },
              child: ImageIcon(
                AssetImage("assets/edite.png"),
                color: !readOnly ? HexColor("#FD8200") : HexColor("#B1B1B1"),
              ))
        ],
      ),
    );
  }
}
