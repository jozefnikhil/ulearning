import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget thirdpartylogin() {
  return Container(
    margin: EdgeInsets.only(left: 80, right: 80, top: 40, bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        loginbutton("assets/images/google.png"),
        loginbutton("assets/images/apple.png"),
        loginbutton("assets/images/facebook.png"),
      ],
    ),
  );
}

Widget loginbutton(String imgpath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(height: 40.h, width: 40.w, child: Image.asset(imgpath)),
  );
}

