import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/features/lesson%20detail/repo/lesson_repo.dart';
import 'package:video_player/video_player.dart';
part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(Ref ref, {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response = await LessonRepo.courseLessonDetail(
    params: lessonRequestEntity,
  );
  if (response.code == 200) {
    var url = response.data!.elementAt(0).video!.elementAt(0).url!;
    videoPlayerController = VideoPlayerController.network(url);

    var initializedVideoPlayerFuture = videoPlayerController?.initialize();

    LessonVideo vidInstance = LessonVideo(
      lessonItem: response.data!.elementAt(0).video!,
      isPlaying: true,
      initializeVideoPlayer: initializedVideoPlayerFuture,
      url: url,
    );
    videoPlayerController?.play();
    ref
        .read(lessonDataControllerProvider.notifier)
        .updateLessonData(vidInstance);
  } else {
    log('request failed ${response.code}');
  }
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  void updateLessonData(LessonVideo lessons) {
    update((data) => lessons);
    // update(
    //   (data) => data.copyWith(
    //      url: lessons.url,
    //     initializeVideoPlayer: lessons.initializeVideoPlayer,
    //     lessonItem: lessons.lessonItem,
    //     isPlaying: lessons.isPlaying,
    //   ),
    // );
  }

  void playPause(bool isPlay) {
    update((data) => data.copyWith(isPlaying: isPlay));
  }

  void playNextVid(String url) async {
    videoPlayerController?.pause();
    videoPlayerController?.dispose();
    update(
      (data) => data.copyWith(isPlaying: false, initializeVideoPlayer: null),
    );
    // done with resource release

    //next start again
    var vidUrl = url;
    log(vidUrl);

    videoPlayerController = VideoPlayerController.network(vidUrl);

    var initializedVideoPlayerFuture = videoPlayerController?.initialize().then(
      (value) {
        videoPlayerController?.seekTo(Duration(seconds: 0));
        videoPlayerController?.play();
      },
    );

    update(
      (data) => data.copyWith(
        isPlaying: true,
        initializeVideoPlayer: initializedVideoPlayerFuture,
      ),
    );
    videoPlayerController?.play();
  }
}

@riverpod
class VideoIndexController extends _$VideoIndexController {
  @override
  int build() {
    return 0;
  }

  int playEarlyAndNext(bool isEarlyOrNext) {
    var data = ref.watch(lessonDataControllerProvider).value!.lessonItem;
    if (isEarlyOrNext) {
      state = state + 1;

      if (state >= data.length) {
        //this is for right videos
        state = data.length - 1;
        return -1;
      }
    } else {
      //this is for left videos
      state = state - 1;
      if (state < 0) {
        state = 0;
        return -1;
      }
    }
    var videoUrl = data[state].url;

    ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);

    return state;
  }

  void playOrPause() {
    var data = ref.watch(lessonDataControllerProvider).value!;

    if (data.isPlaying) {
      videoPlayerController?.pause();
      ref.read(lessonDataControllerProvider.notifier).playPause(false);
    } else {
      videoPlayerController?.play();
      ref.read(lessonDataControllerProvider.notifier).playPause(true);
    }
  }
}
