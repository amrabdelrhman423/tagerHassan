import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Core/Validation.dart';
import 'package:tagerhasan/Screens/Home/HomeScreen.dart';
import 'package:tagerhasan/Screens/auth/Register/registerScreen.dart';
import 'package:tagerhasan/Screens/auth/ResetPassword/forgetPasswordScreen.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:tagerhasan/Widgets/showDialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Providers/LoginProvider.dart';

class LoginScreen extends StatefulWidget {

  static const routeName="/Login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Consumer<LoginProvider>(
          builder: (context,loginProvider,_)=>
              Form(
                key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" تسجيل دخول",style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "tajawalmedium",
                        fontWeight: FontWeight.w300

                    ),),
                  ],
                ),
                SizedBox(
                  height:35.h,
                ),
                Image.asset("assets/logo.png",scale: 2.7,),
                SizedBox(
                  height:35.h ,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                  child: SingupTextForm(
                    hintText: "ادخل البريد الالكتروني",
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: ImageIcon(
                        AssetImage("assets/driver-license.png"),
                        size: 15,
                       // color: HexColor("#4A4A4A"),
                      ),
                    ),
                    validator: (val){
                      RegExp regEmail=RegExp("");
                      if(val!.isEmpty){
                        return "هذا الحقل فارغ";
                      }else {
                      return  validateEmail(val, "يجب ادخال الايميل بطريقة صحيحه ");
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                  child: SingupTextForm(
                    onChanged: (val){


                    },
                    secure: context.watch<LoginProvider>().isSecure,
                    hintText: "*********",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.ltr,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:0 ),
                      child:Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: ImageIcon(
                          AssetImage("assets/padlock.png"),
                          size: 15,
                        //  color: HexColor("#4A4A4A"),
                        ),
                      ),   ),
                    suffixIcon: IconButton(onPressed: ()=>context.read<LoginProvider>().changeeyeIcon(),icon: Icon(context.watch<LoginProvider>().isSecure?Icons.visibility_outlined:Icons.visibility_off_outlined,)),
                    validator: (val)=>validatePassword(val!,"يجب عليك ادخال الرقم السري لا يقل عن 6 احرف"),
                  ),
                ),

                Padding(padding:const EdgeInsets.symmetric(horizontal: 26,vertical: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: ()=>Navigator.of(context).pushNamed(ForgetPasswordScreen.routeName),
                        child: Text("نسيت كلمة المرور؟",style: TextStyle(
                          fontFamily: "",
                            fontWeight: FontWeight.w500,
                            fontSize: 10.5.sp,
                            color: HexColor("#7E7E7E")
                        )),
                      ),
                      InkWell(
                        onTap: ()=>Navigator.of(context).pushNamed(RegisterScreen.routeName),
                        child: Text("تسجيل حساب جديد",style: TextStyle(
                          fontFamily: "",
                            fontWeight: FontWeight.w500,
                            fontSize: 10.5.sp,
                            color: HexColor("#7E7E7E")
                        ),),
                      ),
                    ],
                  ),

                ),

                Padding(padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                  child: InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate()){
                        showMyDialog(context,text: "لقد قمت بتسجيل الدخول بنجاح").then((value) {
                          Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.routeName, (Route<dynamic> route) => false);
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                          color: HexColor("#FD8200"),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Text(
                          "تسجيل دخول",style: TextStyle(
                            color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ) ,
      ),

      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: HexColor("#34CF58"),
        child:Center(
          child: Image.asset("assets/call.png",scale: 7,),
        ) ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }


}
