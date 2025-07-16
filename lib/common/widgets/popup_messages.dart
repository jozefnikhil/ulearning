import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

//positional optional parameters
toastinfo(
  String msg, {
  Color backgroundcolor = Colors.white,
  Color textcolor = Colors.black,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundcolor,
    textColor: textcolor,
    fontSize: 16.sp,
  );
}
