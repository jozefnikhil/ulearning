import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/appbar_widgets.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/lesson%20detail/controller/lesson_controller.dart';
import 'package:ulearning_app/features/lesson%20detail/view/widget/lesson_detail_widget.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;
  int videoindex = 0;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id['id'];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lessonData = ref.watch(lessonDataControllerProvider);
    ref.watch(videoIndexControllerProvider);
    return Scaffold(
      appBar: buildGlobalAppbar(title: 'Lesson Detail'),
      body: Center(
        child:
            lessonData.value?.lessonItem == null ||
                    lessonData.value!.lessonItem.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    lessonData.when(
                      data:
                          (data) => Column(
                            children: [
                              Container(
                                width: 325.w,
                                height: 200.h,
                                decoration: networkImageDecoration(
                                  imagepath:
                                      "${AppConstants.IMAGE_UPLOADS_PATH}${data.lessonItem[0].thumbnail}",
                                ),
                                child: FutureBuilder(
                                  future: data.initializeVideoPlayer,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return videoPlayerController == null
                                          ? Container()
                                          : Stack(
                                            children: [
                                              VideoPlayer(
                                                videoPlayerController!,
                                              ),
                                            ],
                                          );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.w,
                                  right: 25.w,
                                  top: 10.h,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // videoindex = videoindex - 1;
                                        // if (videoindex < 0) {
                                        //   videoindex = 0;
                                        //   toastinfo('No Earlier videos');
                                        //   return;
                                        // }
                                        // var videoUrl =
                                        //     data.lessonItem[videoindex].url;

                                        // ref
                                        //     .read(
                                        //       lessonDataControllerProvider
                                        //           .notifier,
                                        //     )
                                        //     .playNextVid(videoUrl!);

                                        var indexVal = ref
                                            .read(
                                              videoIndexControllerProvider
                                                  .notifier,
                                            )
                                            .playEarlyAndNext(false);
                                        if (indexVal == -1) {
                                          toastinfo('No more early videos');
                                        }
                                      },
                                      child: AppImage(
                                        imagepath: ImageRes.rewindleft,
                                        height: 24.h,
                                        width: 24.w,
                                      ),
                                    ),
                                    SizedBox(width: 15.w),
                                    GestureDetector(
                                      onTap: () {
                                        ref
                                            .read(
                                              videoIndexControllerProvider
                                                  .notifier,
                                            )
                                            .playOrPause();
                                      },
                                      child:
                                          data.isPlaying
                                              ? AppImage(
                                                imagepath: ImageRes.pausebutton,
                                                height: 24.h,
                                                width: 24.w,
                                              )
                                              : AppImage(
                                                imagepath: ImageRes.play,
                                                height: 24.h,
                                                width: 24.w,
                                              ),
                                    ),
                                    SizedBox(width: 15.w),
                                    GestureDetector(
                                      onTap: () {
                                        // videoindex = videoindex + 1;
                                        // if (videoindex >=
                                        //     data.lessonItem.length) {
                                        //   videoindex =
                                        //       data.lessonItem.length - 1;
                                        //   toastinfo(
                                        //     'You have seen all the videos',
                                        //   );
                                        //   return;
                                        // }
                                        // var videoUrl =
                                        //     data.lessonItem[videoindex].url;

                                        // ref
                                        //     .read(
                                        //       lessonDataControllerProvider
                                        //           .notifier,
                                        //     )
                                        //     .playNextVid(videoUrl!);

                                        var indexVal = ref
                                            .read(
                                              videoIndexControllerProvider
                                                  .notifier,
                                            )
                                            .playEarlyAndNext(true);
                                        if (indexVal == -1) {
                                          toastinfo(
                                            'You have seen all the videos',
                                          );
                                        }
                                      },
                                      child: AppImage(
                                        imagepath: ImageRes.rewindright,
                                        height: 24.h,
                                        width: 24.w,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 25.w,
                                  right: 25.w,
                                ),
                                child: LessonVideos(
                                  lessondata: data.lessonItem,
                                  ref: ref,
                                  syncVideoIndex: syncVideoIndex,
                                ),
                              ),
                            ],
                          ),
                      error: (error, stackTrace) => Text('$error'),
                      loading: () => Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
      ),
    );
  }

  void syncVideoIndex(int index) {
    videoindex = index;
  }
}
