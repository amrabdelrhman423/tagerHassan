import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tagerhasan/Core/Validation.dart';
import 'package:tagerhasan/Widgets/CustomeAppBar.dart';
import 'package:tagerhasan/Widgets/SingupTextForm.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewSellerScreen extends StatefulWidget {
  static const routeName="/AddNewSeller";

  const AddNewSellerScreen({Key? key}) : super(key: key);

  @override
  _AddNewSellerScreenState createState() => _AddNewSellerScreenState();
}

class _AddNewSellerScreenState extends State<AddNewSellerScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String ?segl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(context,actions: false,title:  "اضافة متجر جديد",),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.sp,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("اسم المتجر ",style: TextStyle(
                        fontSize: 14.5.sp,
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
                    if(val!.length < 3){
                      return "يجب ان يكون الاسم اكثر من 3 حروف";
                    }else if(val.isEmpty){
                      return "هذا الحقل اجباري";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("رقم الجوال",style: TextStyle(
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingupTextForm(
                  textInputType: TextInputType.phone,
                  validator: (val){
                    if(val!.isEmpty){
                      return "الحقل فارغ";
                    }else{
                      return validateNumber(val,"يجب عليك ادخال رقم صحيح");
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("البريد الإلكتروني",style: TextStyle(
                        fontSize: 14.5.sp,
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
                  validator: (val){
                    if(val!.isEmpty){
                      return "هذا الحقل فارغ";
                    }else{
                      return validateEmail(val,"يجب ادخال الايميل بطريقة صحيحه ");
                    }
                  },
                ),

                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("رقم السجل التجاري",style: TextStyle(
                        fontSize: 14.5.sp,
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
                  onChanged: (val){
                    segl=val;
                  },
                  validator: (val){
                    if(val!.isEmpty){
                      return " يجب عليك ادخال رقم السجل";
                    }
                  },

                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(" نسبة التاجر حسن",style: TextStyle(
                        fontSize: 14.5.sp,
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
                  hintText: "يجب ألا تنقص عن %4",
                  validator: (val){
                    if(val!.isEmpty){
                      return "يجب ان تدخل نسبة التاجر حسن";
                    }else if(int.parse(val) < 5){
                      return "يجب ألا تنقص عن %4";
                    }else if(int.parse(val)>100){
                      return "يجب ألا تزيد النسبة عن 100";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text("المدينة",style: TextStyle(
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownSearch<String>(
                    dropdownSearchDecoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      focusedErrorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color:  Colors.red),
                      ),
                      errorBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color:  Colors.red),
                      ),
                      enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color:Colors.grey.withOpacity(0.1) ),

                      ) ,
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color:Colors.grey.withOpacity(0.1) ),
                      ) ,
                    ),
                    dropdownButtonBuilder: (_) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.keyboard_arrow_down,color: HexColor("#C5C5C5"),),
                    ),
                    mode: Mode.MENU,
                    showSelectedItem: true,

                    items: ["الرياض","مكة","المدينة"],
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
                ),
                SizedBox(
                  height: 30.sp,
                ),
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.pop(context);
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
                        'اضافة متجر',
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
