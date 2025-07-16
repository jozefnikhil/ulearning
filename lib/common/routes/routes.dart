import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/features/course%20detail/view/course_detail.dart';
import 'package:ulearning_app/features/lesson%20detail/view/lesson_detail.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/application/view/application.dart';
import 'package:ulearning_app/features/home/view/home.dart';
import 'package:ulearning_app/features/sign%20in/view/sign_in.dart';
import 'package:ulearning_app/features/sign%20up/view/sign_up.dart';
import 'package:ulearning_app/features/welcome/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(page: Welcome(), path: AppRoutesNames.welcome),
      RouteEntity(page: SignIn(), path: AppRoutesNames.signin),
      RouteEntity(page: SignUp(), path: AppRoutesNames.signup),
      RouteEntity(page: Application(), path: AppRoutesNames.application),
      RouteEntity(page: Home(), path: AppRoutesNames.home),
      RouteEntity(page: CourseDetail(), path: AppRoutesNames.courseDetail),
      RouteEntity(page: LessonDetail(), path: AppRoutesNames.lessonDetail),
    ];
  }

  static MaterialPageRoute generalRouteSettings(RouteSettings settings) {
    log('my route name is ${settings.name}');

    if (settings.name != null) {
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirsttime = Global.storageService.getDeviceFirstOpen();
        log('$deviceFirsttime');
        if (result.first.path == AppRoutesNames.welcome && deviceFirsttime) {
          log('on welcome page');

          bool isLoggedin = Global.storageService.isLogged();
          if (isLoggedin) {
            return MaterialPageRoute(
              builder: (_) => Application(),
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => SignIn(),
              settings: settings,
            );
          }
        } else {
          if (kDebugMode) {
            log('App ran first time');
          }
          return MaterialPageRoute(
            builder: (_) => result.first.page,
            settings: settings,
          );
        }
      }
    }

    return MaterialPageRoute(builder: (_) => Welcome(), settings: settings);
  }
}

class RouteEntity {
  String path;
  Widget page;
  RouteEntity({required this.page, required this.path});
}
