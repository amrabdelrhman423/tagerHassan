import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Screens/auth/ResetPassword/ResetPasswordScreen.dart';
import 'package:tagerhasan/Widgets/otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = "/OtpScreen";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var _formKey = GlobalKey<FormState>();
  int _start = 10;
  bool stopedTimer = true;
  bool finish = false;
  late Timer _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            stopedTimer = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "كود التأكيد",
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Center(
                child: Text(
                  'تم إرسال رمز تأكيد مكون من 6 أرقام\nإلى 054 0000 0000 عبر الرسائل القصيرة.',
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 18,
                    color: const Color(0xff140f26),
                    fontWeight: FontWeight.w700,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OTPDigitTextFieldBox(
                      first: false,
                      last: false,
                      readonly: false,
                      onChange: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.length == 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                    OTPDigitTextFieldBox(
                      first: false,
                      last: false,
                      readonly: false,
                      onChange: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.length == 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                    OTPDigitTextFieldBox(
                      first: false,
                      last: false,
                      readonly: false,
                      onChange: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.length == 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                    OTPDigitTextFieldBox(
                      first: false,
                      last: true,
                      readonly: false,
                      onChange: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                          setState(() {
                            finish = true;
                          });
                        }
                        if (value.length == 0) {
                          FocusScope.of(context).previousFocus();
                          setState(() {
                            finish = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              finish
                  ? InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context)
                              .pushNamed(ResetPasswordScreen.routeName);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.84,
                        height: 60,
                        decoration: BoxDecoration(
                            color: HexColor("#FD8200"),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            "متابعة",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "TajawalBold",
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {},
                      child: Text(
                        'إعادة إرسال رمز التأكيد (${_start})',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 15.sp,
                          color: const Color(0x66140f26),
                          fontWeight: FontWeight.w500,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
              SizedBox(
                height: 150.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
