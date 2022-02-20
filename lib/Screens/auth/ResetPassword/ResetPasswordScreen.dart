import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Core/Validation.dart';
import 'package:tagerhasan/Providers/ResetPasswordProvider.dart';
import 'package:tagerhasan/Screens/Home/HomeScreen.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/showDialog.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "/resetPassword";

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  var _formKey = GlobalKey<FormState>();
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "إعادة تعيين كلمة المرور",
          style: TextStyle(color: Colors.black, fontFamily: "Tajawal-Regular"),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<ResetPasswordProvider>(
          builder: (context, resetPasswordProvider, _) {
            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'كلمة المرور الحالية',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xff3b3b4d),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SingupTextForm(
                      hintText: "********",
                      secure: resetPasswordProvider.isSecureOldPassword,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: ImageIcon(
                          AssetImage("assets/padlock.png"),
                          size: 15,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: IconButton(
                            onPressed: () {
                              resetPasswordProvider
                                  .changeeyeIconforOldPassword();
                            },
                            icon: Icon(resetPasswordProvider.isSecureOldPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined)),
                      ),
                      validator: (val) => validatePassword(
                          val!, "يجب عليك ادخال الرقم السري لا يقل عن 6 احرف"),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'كلمة المرور الجديدة',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xff3b3b4d),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SingupTextForm(
                      hintText: "********",
                      secure: resetPasswordProvider.isSecureNewPassword,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: ImageIcon(
                          AssetImage("assets/padlock.png"),
                          size: 15,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: IconButton(
                            onPressed: () {
                              resetPasswordProvider
                                  .changeeyeIconforNewPassword();
                            },
                            icon: Icon(resetPasswordProvider.isSecureNewPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined)),
                      ),
                      onChanged: (val) {
                        password = val;
                      },
                      validator: (val) => validatePassword(
                          val!, "يجب عليك ادخال الرقم السري لا يقل عن 6 احرف"),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'إعادة كلمة المرور الجديدة',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 15.sp,
                              color: const Color(0xff3b3b4d),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SingupTextForm(
                      hintText: "********",
                      secure: resetPasswordProvider.isSecureforConfirmPassword,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: ImageIcon(
                          AssetImage("assets/padlock.png"),
                          size: 15,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: IconButton(
                            onPressed: () {
                              resetPasswordProvider
                                  .changeeyeIconforConfirmPassword();
                            },
                            icon: Icon(
                                resetPasswordProvider.isSecureforConfirmPassword
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined)),
                      ),
                      validator: (val) => validateConfirmPassword(
                          val!,
                          password!,
                          "يجب عليك ادخال الرقم السري لا يقل عن 6 احرف",
                          "يجب ان يتطابقا "),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {


                          showMyDialog(context,text: "تم تغير كلمة المرور بنجاح").then((value){
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                    (Route<dynamic> route) => false);
                          });

                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfffd8200),
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        child: Center(
                          child: Text(
                            'إعادة تعيين',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 18,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              height: 0.6666666666666666,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
