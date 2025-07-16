import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';

class AppImage extends StatelessWidget {
  final String imagepath;
  final double width;
  final double height;
  final Color color;
  const AppImage({
    super.key,
    this.imagepath = ImageRes.profile,
    this.width = 16,
    this.height = 16,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagepath.isEmpty ? ImageRes.profile : imagepath,
      width: width.w,
      height: height.h,
      color: color,
    );
  }
}

Widget appimagewithColor({
  String imagepath = '',
  double width = 16,
  double height = 16,
  Color colors = AppColors.primaryElement,
}) {
  return Image.asset(
    imagepath.isEmpty ? ImageRes.profile : imagepath,
    width: width.w,
    height: height.h,
    color: colors,
  );
}
