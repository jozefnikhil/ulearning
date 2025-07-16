import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

BoxDecoration appboxshadow({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sr = 1,
  double br = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    border: border,
    borderRadius: BorderRadius.circular(radius.w),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withAlpha(26),
        spreadRadius: sr.r,
        blurRadius: br.r,
        offset: Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration appboxshadowWithRadius({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double sr = 1,
  double br = 2,
  BoxBorder? border,
}) {
  return BoxDecoration(
    color: color,
    border: border,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.h),
      topRight: Radius.circular(20.h),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withAlpha(26),
        spreadRadius: sr.r,
        blurRadius: br.r,
        offset: Offset(0, 1),
      ),
    ],
  );
}

BoxDecoration boxdecorationtextfield({
  Color color = AppColors.primaryBackground,
  double radius = 15,
  double sr = 1,
  double br = 2,
  Color bordercolor = AppColors.primaryFourElementText,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: bordercolor),
  );
}

class AppBoxDecorationImage extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final BoxFit fit;
  final CourseItem? courseItem;
  final Function()? func;

  const AppBoxDecorationImage({
    super.key,
    this.height = 40,
    this.imagePath = ImageRes.profile,
    this.width = 40,
    this.fit = BoxFit.fitHeight,
    this.courseItem,
    this.func,
  });

  bool get isNetworkImage => imagePath.startsWith('http');

  @override
  Widget build(BuildContext context) {
    log('Print my appbar');

    if (!isNetworkImage) {
      // If it's an asset image
      return GestureDetector(
        onTap: func,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(fit: fit, image: AssetImage(imagePath)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      );
    }

    // If it's a network image
    return GestureDetector(
      onTap: func,
      child: CachedNetworkImage(
        imageUrl: imagePath,
        imageBuilder: (context, imageProvider) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(fit: fit, image: imageProvider),
              borderRadius: BorderRadius.circular(20),
            ),
            child:
                courseItem == null
                    ? Container()
                    : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 28.w),
                          child: FadeText(
                            text: courseItem!.name!,
                            fontSize: 14,
                            color: AppColors.primaryElementText,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 28.w, bottom: 7.h),
                          child: FadeText(
                            text: "${courseItem!.lesson_num} Lessons",
                            color: AppColors.primaryFourElementText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
          );
        },
        placeholder:
            (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget:
            (context, url, error) => const Icon(Icons.error, color: Colors.red),
      ),
    );
  }
}

BoxDecoration networkImageDecoration({required String imagepath}) {
  return BoxDecoration(image: DecorationImage(image: NetworkImage(imagepath)));
}
