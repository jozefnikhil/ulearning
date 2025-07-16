import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

Widget appTextfield({
  TextEditingController? controller,
  String text = "",
  String iconName = "",
  String hinttext = "",
  bool obscuretext = false,
  void Function(String val)? func,
}) {
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text14Normal(text: text),
        SizedBox(height: 5.h),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: boxdecorationtextfield(),
          //row contains icons and textfield
          child: Row(
            children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17),
                child: AppImage(imagepath: iconName),
              ),
              //our textfield
              apptextfieldonly(
                controller: controller,
                func: func,
                hinttext: hinttext,
                obscuretext: obscuretext,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget apptextfieldonly({
  TextEditingController? controller,
  String hinttext = "type your text",
  double width = 280,
  double height = 50,
  void Function(String val)? func,
  bool obscuretext = false,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 7.h, left: 10.w),
        hintText: hinttext,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      onChanged: func,
      maxLines: 1,
      autocorrect: false,
      //by default its false
      obscureText: obscuretext,
    ),
  );
}
