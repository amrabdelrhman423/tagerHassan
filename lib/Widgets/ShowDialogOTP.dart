import 'dart:ui';

import 'package:flutter/material.dart';

import 'otp_text_field.dart';

Future<void> showDialogOTP(context) async {
  var _formKey = GlobalKey<FormState>();

  return showDialog<void>(
    context: context,
    barrierDismissible: true,

    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 5),
        child: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            content: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      // Adobe XD layer: 'Your password has be' (text)
                      Text(
                        'رمز التأكيد',
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 25,
                          color: const Color(0xff3b3b4d),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'أدخل رمز التأكيد الذي استلمه البائع عبر الرسائل القصيرة',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color(0xb26c7b8a),
                          fontWeight: FontWeight.w500,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10,),
                      // Adobe XD layer: 'Your password has be' (text)
                      Row(
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
                                FocusScope.of(context).unfocus();
                              }
                              if (value.length == 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),

                        ],
                      ),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: ()=>_formKey.currentState!.validate()?Navigator.pop(context):print("error in otp"),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.7,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xfffd8200),
                              borderRadius: BorderRadius.circular(10)

                          ),
                          child: Center(
                            child:Text(
                              'ارسال',
                              style: TextStyle(
                                fontSize: 18,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                  fontFamily: "tajawalbold"

                              ),
                              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),

                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
