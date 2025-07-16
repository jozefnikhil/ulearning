import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/globalloader/global_loader.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/services/http_util.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/main.dart';
import 'package:ulearning_app/features/sign%20in/provider/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign%20in/repo/sign_in_repo.dart';
import 'package:ulearning_app/common/models/user.dart';

class SignInControllers {
  // WidgetRef ref;
  SignInControllers();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void handleSignin(WidgetRef ref) async {
    var state = ref.read(signinNotifierProvider);

    String email = state.email;

    String password = state.password;

    emailcontroller.text = email;
    passwordcontroller.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastinfo('your email is empty');
      return;
    }

    if (state.password.isEmpty || password.isEmpty) {
      toastinfo('your password is empty');
      return;
    }
    ref.read(appLoaderProvider.notifier).setLoadervalue(true);
    try {
      final credentials = await SignInRepo.firebaseSignIn(email, password);
      if (credentials.user == null) {
        toastinfo('user not found');
      }

      var user = credentials.user;
      if (user != null) {
        String? displayname = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photourl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photourl;
        loginRequestEntity.name = displayname;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAlldata(loginRequestEntity);
        log('user logged in');
      } else {
        toastinfo("login error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        toastinfo('your password is wrong');
      } else if (e.code == 'user-not-found') {
        toastinfo('user not found');
      } else if (e.code == 'invalid-credential') {
        toastinfo('invalid credentials');
      }
      log(e.code);
    } catch (e) {
      log('4');
    }
    ref.read(appLoaderProvider.notifier).setLoadervalue(false);
  }

  void asyncPostAlldata(LoginRequestEntity loginRequestEntity) async {
    // ref.read(appLoaderProvider.notifier).setLoadervalue(true);
    //we need to talk to server
    var result = await SignInRepo.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setString(
          AppConstants.STROAGE_USER_PROFILE_KEY,
          jsonEncode(result.data),
        );
        Global.storageService.setString(
          AppConstants.STORAGE_USER_TOKEN_KEY,
          result.data?.access_token ?? "",
        );

        navKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutesNames.application,
          (route) => false,
        );
      } catch (e) {
        if (kDebugMode) {
          log(e.toString());
        }
      }
    } else {
      toastinfo("Login Error");
    }

    //have local storage

    //redirect to new page
    // ref.read(appLoaderProvider.notifier).setLoadervalue(false);
  }
}
