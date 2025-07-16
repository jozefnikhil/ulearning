import 'package:ulearning_app/common/models/course_entity.dart';
import 'package:ulearning_app/common/models/lesson_entities.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class CourseRepo {
  static Future<CourseDetailsResponseEntity> courseDetail({
    CourseRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/courseDetail',
      queryParameters: params?.toJson(),
    );

    return CourseDetailsResponseEntity.fromJson(response);
  }

  static Future<LessonListResponseEntity> courseLessonList({
    LessonRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/lessonList',
      queryParameters: params?.toJson(),
    );

    return LessonListResponseEntity.fromJson(response);
  }
}
