import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/api/course_api.dart';
import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/global.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomescreenBannerDots extends _$HomescreenBannerDots {
  @override
  int build() => 0;

  void setIndex(int value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class HomeUserProfile extends _$HomeUserProfile {
  @override
  FutureOr<UserProfile> build() {
    return Global.storageService.getUserProfile();
  }
}

@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList {
  Future<List<CourseItem>?> fetchCourseList() async {
    var result = await CourseApi.courseList();
    if (result.code == 200) {
      return result.data ?? [];
    }
    return [];
  }

  @override
  FutureOr<List<CourseItem>?> build() async {
    return fetchCourseList();
  }
}
