import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tagerhasan/Core/Validation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Providers/RegisterProvider.dart';
import 'package:tagerhasan/Screens/auth/Login/LoginScreen.dart';
import 'package:tagerhasan/Screens/auth/Register/registerScreen.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:tagerhasan/Widgets/pick_Image_TextField.dart';
import 'package:intl/intl.dart';


class PersonalRegisterScreen extends StatefulWidget {
  const PersonalRegisterScreen({Key? key}) : super(key: key);

  @override
  _PersonalRegisterScreenState createState() => _PersonalRegisterScreenState();
}

class _PersonalRegisterScreenState extends State<PersonalRegisterScreen> {
  var _formKey = GlobalKey<FormState>();
  String? password;
  String? confirmPassword;
  DateTime ?selectedDate ;
  String birthday="";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1980),
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2020));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birthday= DateFormat('yyyy-MM-dd ').format(selectedDate!).toString();
      });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //اسم السائق
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "اسمك الأول",
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
                      return "يجب ان يكون الاسم اكثر من 3 حروف";
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
                        "اسمك الثاني",
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
                      return "يجب ان يكون الاسم اكثر من 3 حروف";
                    } else if (val.isEmpty ) {
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
                        "اسم العائلة",
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
                      return "يجب ان يكون الاسم اكثر من 3 حروف";
                    } else if (val.isEmpty || val == null) {
                      return "هذا الحقل اجباري";
                    } else {
                      return null;
                    }
                  },
                ),
                //رقم الجوال
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        " رقم الهوية الوطنية",
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
                  textInputType: TextInputType.phone,
                    validator: (val){
                      if(val!.isEmpty){
                        return "هذا الحقل اجباري";
                      }else if(val.length!=10) {
                        return "يجب ان يكون عدد ارقام الهوية 10 ارقام";
                      }else{
                        return null;
                      }
                    },
                ),
                //البريد الالكتروني
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "تاريخ الميلاد",
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
                  textInputType: TextInputType.datetime,
                  onTap: ()=>_selectDate(context),
                  suffixIcon: Icon(Icons.date_range_outlined),
                  readOnly: true,
                  hintText: birthday,
                  validator: (value) {
                  }
                ),
                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "الجنسية",
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
                DropdownSearch<String>(
                  dropdownSearchDecoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(0.1),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(0.1)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(0.1)),
                    ),
                  ),
                  dropdownButtonBuilder: (_) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: HexColor("#C5C5C5"),
                    ),
                  ),
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["الرياض", "مكة", "المدينة"],
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  hint: "اختار الجنسية",
                  validator: (item) {
                    if (item == null)
                      return "يجب عليك اختيار الجنسية";
                    else
                      return null;
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
                        "المدينة",
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
              DropdownSearch<String>(
                    dropdownSearchDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.1)),
                      ),
                    ),
                    dropdownButtonBuilder: (_) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: HexColor("#C5C5C5"),
                      ),
                    ),
                    mode: Mode.MENU,
                    showSelectedItem: true,
                    items: ["الرياض", "مكة", "المدينة"],
                    popupItemDisabled: (String s) => s.startsWith('I'),
                    onChanged: print,
                    hint: "اختار المدينة",
                    validator: (item) {
                      if (item == null)
                        return "يجب عليك اختيار المدينة";
                      else
                        return null;
                    },
                  ),

                const SizedBox(
                  height: 15,
                ),

                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        " البريد الإلكتروني",
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
                  textInputType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty){
                      return "هذا الحقل فارغ";
                    }else{
                      return validateEmail(value, "يجب ادخال الايميل بطريقة صحيحه ");
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
                        "رقم الجوال",
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
                  textInputType: TextInputType.phone,
                  validator: (value) {

                    if(value!.isEmpty){
                      return "هذا الحقل فارغ";
                    }else{
                      return validateNumber(value, "يجب ادخال رقم الجوال بطريقة صحيحه ");
                    }

                  }
                ),

                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "كلمة المرور",
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
                  secure: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: IconButton(
                        onPressed: () {
                        },
                        icon: Icon(//resetPasswordProvider.isSecureOldPassword
                           // ? Icons.visibility_outlined:
                             Icons.visibility_off_outlined)),
                  ),
                  validator: (val) => validatePassword(
                      val!, "يجب عليك ادخال الرقم السري لا يقل عن 6 احرف"),
                ),

                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "ارفق صورة الهوية سارية المفعول",
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
                PickImageTextField(
                  onImagePicked: (image) {},
                ),

                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "ارفق صورة حديثة لك",
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
                    if (_formKey.currentState!.validate()) {
                      RegisterScreen.tabController!.animateTo(1,duration: Duration(milliseconds: 1000));
                      Provider.of<RegisterProvider>(context,listen: false).changeindexTab(1);
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
