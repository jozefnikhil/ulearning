import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/features/course%20detail/repo/course_repo.dart';
part 'course_controller.g.dart';

@riverpod
Future<CourseItem?> courseDetailController(Ref ref,{required int index}) async {

  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response = await CourseRepo.courseDetail(
    params: courseRequestEntity,
  );
  if (response.code == 200) {
    return response.data;
  } else {
    log('request failed ${response.code}');
  }
  return null;
}

@riverpod
Future<List<LessonItem>?> courseLessonListController(Ref ref,{required int index}) async {

  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response = await CourseRepo.courseLessonList(
    params: lessonRequestEntity,
  );
  if (response.code == 200) {
    return response.data;
  } else {
    log('request failed ${response.code}');
  }
  return null;
}
