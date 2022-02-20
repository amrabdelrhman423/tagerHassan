import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Providers/RegisterProvider.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';
import 'package:tagerhasan/Screens/auth/Register/registerScreen.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/pick_Image_TextField.dart';



class CarRedister extends StatefulWidget {
   CarRedister({Key? key}) : super(key: key);

  @override
  _CarRedisterState createState() => _CarRedisterState();
}

class _CarRedisterState extends State<CarRedister> {
  var _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "ماركة المركبة",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingupTextForm(
                  textInputType: TextInputType.name,
                  validator: (val) {
                    if (val!.length < 3) {
                      return "يجب ان يكون ماركة المركبة اكثر من 3 حروف";
                    } else if (val.isEmpty || val == null) {
                      return "هذا الحقل اجباري";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "طراز المركبة",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingupTextForm(
                  textInputType: TextInputType.name,
                  validator: (val) {
                    if (val!.length < 3) {
                      return "يجب ان يكون ماركة المركبة اكثر من 3 حروف";
                    } else if (val.isEmpty || val == null) {
                      return "هذا الحقل اجباري";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "سنة الصنع",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingupTextForm(
                  textInputType: TextInputType.number,
                  validator: (val) {
                    if (val!.length<4||val.isEmpty){
                      return "يجب ادخال السنة بطريقة صحيحه";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "رقم اللوحة",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SingupTextForm(
                  textInputType: TextInputType.number,
                  validator: (val) {
                    if (val!.length < 4) {
                      return "يجب ان يكون رقم اللوحة اكثر من 3 ارقام";
                    } else if (val.isEmpty || val == null) {
                      return "هذا الحقل اجباري";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "ارفق صورة رخصة السير الخاصة بالمركبة",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "Tajawal",
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                PickImageTextField(
                  onImagePicked: (image) {},
                ),

                const SizedBox(
                  height: 20,
                ),

                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      RegisterScreen.tabController!.animateTo(2,duration: Duration(milliseconds: 1000));
                      Provider.of<RegisterProvider>(context,listen: false).changeindexTab(2);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                        color: HexColor("#FD8200"),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        " التالي",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: const Color(0xff1d2323),
                    ),
                    children: [
                      TextSpan(
                        text: ' لديك حساب ؟ ',
                        style: TextStyle(
                          color: HexColor("#BEBEBE"),
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                LoginScreen.routeName,
                                    (Route<dynamic> route) => false);
                          },
                        text: 'سجل الدخول ',
                        style: TextStyle(
                          color: HexColor("#FD8200"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
