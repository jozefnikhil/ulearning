import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/utils/constants.dart';

class StorageService {
  late final SharedPreferences _pref;
  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return await _pref.setString(key, value);
  }

  String getString(String key) {
    return _pref.getString(key) ?? "";
  }

  String getUserToken() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  Future<bool> setBool(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_KEY_FIRST) ?? false;
  }

  bool isLogged() {
    return _pref.getString(AppConstants.STROAGE_USER_PROFILE_KEY) != null
        ? true
        : false;
  }

  UserProfile getUserProfile() {
    var profile = _pref.getString(AppConstants.STROAGE_USER_PROFILE_KEY) ?? "";
    var profileJson = jsonDecode(profile);
    var userprofile = UserProfile.fromJson(profileJson);
    return userprofile;
  }
}
