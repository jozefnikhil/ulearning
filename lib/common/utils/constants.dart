import 'dart:io';

class AppConstants {
  static String get SERVER_API_URL {
    return Platform.isAndroid
        ? "http://10.131.250.168:8000/"
        : "http://127.0.0.1:8000/";
  }
  // static const String SERVER_API_URL_ANDROID = Platform.isAndroid?
  //   ? "http://10.0.2.2:8000"
  //   : "http://127.0.0.1:8000";

  // static const String SERVER_API_URL = "http://127.0.0.1:8000/";
  static const String STROAGE_USER_PROFILE_KEY = "user_profile";
  static const String STORAGE_USER_TOKEN_KEY = "user_token";
  static const String STORAGE_DEVICE_OPEN_KEY_FIRST = "first_time";
  static String get IMAGE_UPLOADS_PATH => "${SERVER_API_URL}uploads/";
}
