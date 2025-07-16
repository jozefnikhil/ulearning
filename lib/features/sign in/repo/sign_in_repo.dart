import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ulearning_app/common/models/user.dart';
import 'package:ulearning_app/common/services/http_util.dart';

class SignInRepo {
  static Future<UserCredential> firebaseSignIn(
    String email,
    String password,
  ) async {
    final credentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credentials;
  }

  static Future<UserLoginResponseEntity> login({
    LoginRequestEntity? params,
  }) async {
    log('given info ${jsonEncode(params)}');

    final response = await HttpUtil().post(
      "api/login",
      queryParameters: params!.toJson(),
    );

    // response.data is the full JSON map
    return UserLoginResponseEntity.fromJson(response); // ✅ parse full response
  }
}
