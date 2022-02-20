import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Core/Validation.dart';
import 'package:tagerhasan/Screens/TermsAndCondations/TermsAndCondationsScreen.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:tagerhasan/Widgets/errorsnackbar.dart';
import 'package:tagerhasan/Widgets/showDialog.dart';

class BankRegister extends StatefulWidget {
  const BankRegister({Key? key}) : super(key: key);

  @override
  _BankRegisterState createState() => _BankRegisterState();
}

class _BankRegisterState extends State<BankRegister> {
  var _formkey = GlobalKey<FormState>();
  bool aceeptterms = true;
  bool  admit=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'لا يتم قبول أي حسابات بنكية لا تخص المندوب نفسه',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xffe4002b),
                    fontWeight: FontWeight.w500,
                    height: 1.5357142857142858,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "اسم البنك التابع له",
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
                Container(
                  child: DropdownButtonFormField<String>(
                    hint: Text(
                      "اختار اسم البنك التابع له",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: const Color(0xff9b9b9b),
                      ),
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 15),
                      filled: true,
                      fillColor: HexColor("#F0F0F0"),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.1)),
                      ),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: HexColor("#C5C5C5"),
                      ),
                    ),
                    items: <String>['مصرف الراجحي', 'مصرف الراجح', 'C', 'D']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: print,
                    validator: (item) {
                      if (item == null)
                        return "يجب عليك اختيار البنك";
                      else
                        return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "اسم صاحب الحساب",
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
                    if (val!.length < 5) {
                      return "يجب ان يكون اسم صاحب الحساب اكثر من 5 حروف";
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
                        "رقم الايبان",
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingupTextForm(
                  textInputType: TextInputType.text,
                  validator: (val) {
                    if (val!.isEmpty || val == null) {
                      return "يجب عليك ملئ هذا الحقل ";
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
                        "رقم الحساب",
                        style: TextStyle(
                          fontSize: 14.5.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingupTextForm(
                  textInputType: TextInputType.number,
                  validator: (val) {
                    if(val!.isEmpty){
                      return "هذا الحقل مطلوب";
                    }else if(val.length < 16){
                      return "يجب ان يكون اكثر من 16 رقم";
                    }
                  }
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    new Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                              color: HexColor("#F0F0F0")
                          )
                      ),
                      value: admit,
                      activeColor: HexColor("#FD8200"),
                      onChanged: (bool? value) {
                        setState(() {
                          admit = value!;
                        });
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Center(
                        child: Text(
                          'أقر بأن جميع المعلومات التي قمت بتعبئتها صحيحة وتخصني',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: const Color(0xff140f26),
                          ),
                          textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    new Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                              color: HexColor("#F0F0F0")
                          )
                      ),
                      value: aceeptterms,
                      activeColor: HexColor("#FD8200"),
                      onChanged: (bool? value) {
                        setState(() {
                          aceeptterms = value!;
                        });
                      },
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Center(
                        child: // Adobe XD layer: 'staff picks' (text)
                        Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xff140f26),
                              height: 1.5,
                            ),
                            children: [
                              TextSpan(
                                text: 'أوافق على ',
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed(
                                        TermsAndCondationsScreen.routeName);
                                  },
                                text: 'الشروط والأحكام ',
                                style: TextStyle(
                                  color: const Color(0xfffd8200),
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(
                                text: 'الخاصة بالتطبيق والمخصصة للمندوب ومضافة من قبل مدير النظام',
                              ),
                            ],
                          ),

                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()&&aceeptterms &&admit) {
                      showMyDialog(context,
                          text:
                          'طلبك قيد المراجعة وستصل رسالة نصية لتأكيد الموافقة من قبل الإدارة')
                          .then((value) {
                        showMyDialog(context,
                            text:
                            'طلبك لا يزال قيد المراجعة من قبل المسؤول')
                            .then((value) {
                          showMyDialog(context,
                              text:
                              'تم رفض طلبك ،الرجاء الاتصال بالدعم الفني على 0540000000');
                        });
                      });
                    }else if(!admit){
                      showSnackbarWithError(context, "يجب عليك الاقرار بأن جميع المعلومات التي قمت بتعبئتها تخصك");
                    }else if(!aceeptterms){
                      showSnackbarWithError(context, "يجب عليك الموافقة علي الشروط والاحكام");
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
                        " انشاء حساب جديد",
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
