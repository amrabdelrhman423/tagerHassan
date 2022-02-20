import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Core/Validation.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tagerhasan/Widgets/showDialog.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);
  static const routeName="/ContactUs";


  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(context,actions: false,title: "اتصل بنا"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("الاسم",style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingupTextForm(
                  textInputType: TextInputType.name,
                  validator: (val){
                    if(val!.isEmpty||val==null){
                      return "يجب عليك ملئ هذا الحقل ";
                    }else if(val.length<3){
                      return "يجب ان يكون الاسم اكثر من 3 حروف";
                    }else{
                      return null;

                    }
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("رقم الجوال",style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingupTextForm(
                  textInputType: TextInputType.number,
                  validator: (val){
                    if(val!.isEmpty){
                      return "هذا الحقل فارغ";
                    }else{
                      return validateNumber(val,"يجب عليك ادخال رقم صحيح");
                    }
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("البريد الإلكتروني",style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingupTextForm(
                  textInputType: TextInputType.emailAddress,
                  validator: (val)=>validateEmail(val!,"يجب ادخال الايميل بطريقة صحيحه "),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("الرسالة",style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingupTextForm(
                  textInputType: TextInputType.text,
                  maxLine: 5,
                  validator: (val){
                    if(val!.isEmpty||val==null){
                      return "يجب عليك ملئ هذا الحقل ";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      showMyDialog(context,text: "تم ارسال الرسالة بنجاح");
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: HexColor("#FD8200"),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: // Adobe XD layer: '✏️button-label' (text)
                      Text(
                        ' ارسال',
                        style: TextStyle(
                          fontSize: 15.sp,
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
              ],
            ),
          ),
        ),
      ),
    );
  }


}
