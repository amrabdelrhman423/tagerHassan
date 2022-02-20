import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Core/Validation.dart';
import 'package:tagerhasan/Screens/auth/ResetPassword/otpScreen.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = "/forgetPassword";
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordScreen> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "نسيت كلمة المرور",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Center(
                child: Text(
                  'أدخل رقم هاتفك لتلقي رمز التأكيد',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 16.sp,
                    color: const Color(0xff140f26),
                    fontWeight: FontWeight.w700,
                    height: 1.4333333333333333,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingupTextForm(
                  hintText: "5xxxxxxxx",
                  textInputType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                  hinttextDirection: TextDirection.ltr,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "966+",
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        ImageIcon(
                          AssetImage("assets/call.png"),
                          size: 20,
                        )
                      ],
                    ),
                  ),
                  validator: (val){
                    if(val!.isEmpty){
                      return "الحقل فارغ";
                    }else{
                    return  validateNumber(val, "يجب عليك ادخال رقم صحيح");
                    }
                  }
                      ,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, OtpScreen.routeName);
                    }
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color(0xfffd8200),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        'متابعة',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "tajawalbold",
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: HexColor("#34CF58"),
        child: Center(
          child: Image.asset(
            "assets/call.png",
            scale: 7,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
