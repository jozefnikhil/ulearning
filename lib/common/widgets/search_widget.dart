import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
      //search text
      Container(
        width: 280.w,
        height: 40.h,
        decoration: appboxshadow(
          color: AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              child: AppImage(imagepath: ImageRes.search),
            ),
            SizedBox(
              height: 40.h,
              width: 240.w,
              child: apptextfieldonly(
                width: 240,
                height: 40,
                hinttext: 'Search your course....',
              ),
            ),
          ],
        ),
      ),
      //search button
      GestureDetector(
        child: Container(
          height: 40.h,
          width: 40.w,
          padding: EdgeInsets.all(5.w),
          decoration: appboxshadow(
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Transform.rotate(
            angle: 270 * 3.1415926535 / 180, // rotate 270 degrees (in radians)
            child: appimagewithColor(
              imagepath: ImageRes.options,
              colors: AppColors.primaryBackground,
            ),
          ),
        ),
      ),
    ],
  );
}
