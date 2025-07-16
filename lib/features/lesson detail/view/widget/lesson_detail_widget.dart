import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/lesson%20detail/controller/lesson_controller.dart';

class LessonVideos extends StatelessWidget {
  final List<LessonVideoItem> lessondata;
  final WidgetRef ref;
  final Function syncVideoIndex;
  const LessonVideos({
    super.key,
    required this.lessondata,
    required this.ref,
    required this.syncVideoIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lessondata.length,
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
                // Navigator.of(context).pushNamed(
                //   "/lesson_Detail",
                //   arguments: {"id": lessondata[index].id.toString()},
                // );
                syncVideoIndex(index);
                var vidUrl = lessondata[index].url;

                ref
                    .read(lessonDataControllerProvider.notifier)
                    .playNextVid(vidUrl!);
              },
              child: Row(
                children: [
                  AppBoxDecorationImage(
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.fill,
                    imagePath:
                        "${AppConstants.IMAGE_UPLOADS_PATH}${lessondata[index].thumbnail}",
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text13Normal(text: "${lessondata[index].name}"),
                        // Text10Normal(text: "${lessondata[index].description}"),
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
    );
  }
}
