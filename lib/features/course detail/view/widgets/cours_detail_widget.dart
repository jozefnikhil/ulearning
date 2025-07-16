import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart' show ImageRes;
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/buttons_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/lesson%20detail/controller/lesson_controller.dart';

class CourseDetailThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailThumbnail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return AppBoxDecorationImage(
      width: 325.w,
      height: 200.h,
      fit: BoxFit.fitWidth,
      imagePath: "${AppConstants.IMAGE_UPLOADS_PATH}${courseItem.thumbnail}",
    );
  }
}

class CourseImageIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseImageIconText({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: appboxshadow(radius: 7),
              child: Text10Normal(
                text: "Author Page",
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(imagepath: ImageRes.group),
                Text11Normal(
                  text:
                      courseItem.follow == null
                          ? '0'
                          : courseItem.follow.toString(),

                  color: AppColors.primaryThreeElementText,
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(imagepath: ImageRes.star),
                Text11Normal(
                  text:
                      courseItem.score == null
                          ? '0'
                          : courseItem.score.toString(),

                  color: AppColors.primaryThreeElementText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseDetailDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailDescription({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: courseItem.name ?? 'No Name found',
            color: AppColors.primaryText,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.bold,
          ),
          Container(
            child: Text11Normal(
              text: courseItem.description ?? 'No description',
              color: AppColors.primaryThreeElementText,
            ),
          ),
        ],
      ),
    );
  }
}

class CourseDetailGoBuyButton extends StatelessWidget {
  const CourseDetailGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: AppButton(buttonName: 'Go Buy'),
    );
  }
}

class CourseDetailIncludes extends StatelessWidget {
  final CourseItem? courseItem;
  const CourseDetailIncludes({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text14Normal(
            text: 'The Course Includes',
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 12.h),
          CourseInfo(
            imagePath: ImageRes.video,
            length: courseItem!.video_len,
            infoText: 'Hours video',
          ),
          SizedBox(height: 16.h),
          CourseInfo(
            imagePath: ImageRes.file,
            length: courseItem!.video_len,
            infoText: 'Number of files',
          ),
          SizedBox(height: 16.h),
          CourseInfo(
            imagePath: ImageRes.download,
            length: courseItem!.down_num,
            infoText: 'Number of items to download',
          ),
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final String imagePath;
  final int? length;
  final String? infoText;
  const CourseInfo({
    super.key,
    required this.imagePath,
    this.length,
    this.infoText = "number",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35.h,
          width: 35.w,
          decoration: appboxshadow(radius: 9),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: AppImage(
              imagepath: imagePath,
              width: 30.w,
              height: 30.h,
              color: AppColors.primaryBackground,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Text11Normal(
            text:
                length.hashCode != null.hashCode
                    ? "$length $infoText"
                    : "0 $infoText",
            color: AppColors.primarySecondaryElementText,
          ),
        ),
      ],
    );
  }
}

class LessonInfo extends StatelessWidget {
  final List<LessonItem> lessonitems;
  final WidgetRef ref;
  const LessonInfo({super.key, required this.lessonitems, required this.ref});

  @override
  Widget build(BuildContext context) {
    log('Lesson data ${lessonitems.length}');
    return Container(
      margin: EdgeInsets.only(top: 20.h),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lessonitems.isNotEmpty
              ? Text14Normal(
                text: 'Lesson List',
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              )
              : SizedBox(),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: lessonitems.length,
            itemBuilder:
                (context, index) => Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 325.w,
                  height: 80.h,
                  decoration: appboxshadow(
                    radius: 10,
                    sr: 2,
                    br: 3,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: InkWell(
                    onTap: () {
                      ref.watch(
                        lessonDetailControllerProvider(
                          index: lessonitems[index].id!,
                        ),
                      );
                      Navigator.of(context).pushNamed(
                        "/lesson_Detail",
                        arguments: {"id": lessonitems[index].id.toString()},
                      );
                    },
                    child: Row(
                      children: [
                        AppBoxDecorationImage(
                          width: 60.w,
                          height: 60.h,
                          fit: BoxFit.fill,
                          imagePath:
                              "${AppConstants.IMAGE_UPLOADS_PATH}${lessonitems[index].thumbnail}",
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text13Normal(text: "${lessonitems[index].name}"),
                              Text10Normal(
                                text: "${lessonitems[index].description}",
                              ),
                            ],
                          ),
                        ),
                        AppImage(
                          imagepath: ImageRes.arrow_right,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
