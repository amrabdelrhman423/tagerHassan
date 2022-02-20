import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class OTPDigitTextFieldBox extends StatefulWidget {
  final bool first;
  final bool last;
  final readonly;
  final ValueChanged? onChange;

  const OTPDigitTextFieldBox(
      {Key ?key,
        required this.first,
        required this.last,
        this.readonly = false,
        this.onChange})
      : super(key: key);

  @override
  _OTPDigitTextFieldBoxState createState() => _OTPDigitTextFieldBoxState();
}

class _OTPDigitTextFieldBoxState extends State<OTPDigitTextFieldBox> {
  FocusNode _textFieldFocus = FocusNode();
  Color _color = Colors.grey.withOpacity(0.1);

  @override
  void initState() {
    _textFieldFocus.addListener((){
      if(_textFieldFocus.hasFocus){
        setState(() {
          _color = Colors.white;
        });
      }else{
        setState(() {
          _color = Colors.grey.withOpacity(0.1);
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(top: 10, left: 8, right: 0),
       // height: 700,
        width: MediaQuery.of(context).size.width*0.14,
        child: TextFormField(
          focusNode: _textFieldFocus,
          style: TextStyle(
            fontSize: 30
          ),
          autofocus: true,
          onChanged: widget.onChange,
          validator: (val) {
            if (val!.isEmpty) {
              return "حقل فارغ";
            } else {
              return null;
            }
          },
          showCursor: true,
          readOnly: widget.readonly,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            fillColor: _color,
            filled: true,
           // focusColor: Colors.white,
            counter: SizedBox.shrink(),
            counterStyle: TextStyle(
            ),
            counterText: "",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color:Colors.grey.withOpacity(0.1) ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2,color:HexColor("#ED6A1D") ),
            ),
          ),

        ),
      );
  }
}