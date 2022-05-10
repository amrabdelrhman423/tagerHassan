import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SingupTextForm extends StatelessWidget {
  SingupTextForm(
      {Key? key,
      this.textInputType,
      this.hintText,
      this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.textAlign=TextAlign.justify,
      this.secure = false,
      this.textDirection,
      this.readOnly = false,
      this.textEditingController,
      this.onTap,
      this.value,
      this.hinttextDirection,
      this.onChanged,
      this.maxLine = 1})
      : super(key: key);

  TextInputType? textInputType;
  TextEditingController? textEditingController;
  String? hintText;
  String? Function(String?)? validator;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextAlign? textAlign;
  bool secure = false;
  TextDirection? textDirection;
  TextDirection? hinttextDirection;
  bool readOnly = false;
  Function()? onTap;
  String? value;
  Function(String)? onChanged;
  int? maxLine;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign!,
      controller: textEditingController,
      keyboardType: textInputType,
      textDirection: textDirection,
      readOnly: readOnly,
      obscureText: secure,
      maxLines: maxLine,
      enableSuggestions: false,
      autocorrect: false,
      obscuringCharacter: "*",
      initialValue: value,
      decoration: InputDecoration(
          isDense: true,
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          contentPadding: EdgeInsets.only(top: 17, bottom: 17, right: 8),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: "",
            fontSize: 15.sp,
            color: Color(0x800d0e10),
          ),
          hintTextDirection: hinttextDirection,
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
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
