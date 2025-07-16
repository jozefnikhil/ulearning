import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';

class Apponboardingpage extends StatelessWidget {
  final PageController controller;
  final String imagepath;
  final String title;
  final String subtitle;
  final int index;
  const Apponboardingpage({
    super.key,
    required this.controller,
    required this.imagepath,
    required this.title,
    required this.subtitle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(imagepath, fit: BoxFit.fitWidth),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: text24Normal(text: title),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text16Normal(text: subtitle),
          ),
          _nextbutton(index, controller, context),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

Widget _nextbutton(index, PageController controller, BuildContext context) {
  return GestureDetector(
    onTap: () {
      bool deviceFirsttime = Global.storageService.getDeviceFirstOpen();
      log('from tab $deviceFirsttime');
      if (index < 3) {
        controller.animateToPage(
          index,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      } else {
        Global.storageService.setBool(
          AppConstants.STORAGE_DEVICE_OPEN_KEY_FIRST,
          true,
        );
        Navigator.pushNamed(context, AppRoutesNames.signin);
      }
    },
    child: Container(
      width: 325.w,
      height: 50.h,

      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appboxshadow(),
      child: Center(
        child: Text16Normal(
          text: index == 3 ? "Get Started" : 'Next',
          color: AppColors.primaryElementText,
        ),
      ),
    ),
  );
}
