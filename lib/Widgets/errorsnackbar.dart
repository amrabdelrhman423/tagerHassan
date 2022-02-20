import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
showSnackbarWithError(context,String err){

  var snackBar = SnackBar(
    backgroundColor: HexColor("#DB5C5C"),
    content:  Container(
        height: 30,
        child: Center(child: Text(err))),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}