import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/globalloader/global_loader.dart';
import 'package:ulearning_app/common/widgets/popup_messages.dart';
import 'package:ulearning_app/features/sign%20up/provider/notifier/register_notifier.dart';
import 'package:ulearning_app/features/sign%20up/repo/sign_up_repo.dart';

class SignUpControllers {
  late WidgetRef ref;

  SignUpControllers({required this.ref});

  Future<void> handleSignup() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.username;
    String email = state.email;

    String password = state.password;
    String confirmpassword = state.confirmpassword;

    if (state.username.isEmpty || name.isEmpty) {
      toastinfo('your name is empty');
      return;
    }

    if (state.username.length < 6 || name.length < 6) {
      toastinfo('your name is too short');
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastinfo('your email is empty');
      return;
    }
    if ((state.password != state.confirmpassword) ||
        password != confirmpassword) {
      toastinfo('your password did not match');
      return;
    }

    if ((state.password.isEmpty || state.confirmpassword.isEmpty) ||
        password.isEmpty ||
        confirmpassword.isEmpty) {
      toastinfo('your password is empty');
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoadervalue(true);
    var context = Navigator.of(ref.context);

    try {
      final credentials = await SignUpRepo.firebaseSignUp(email, password);

      log("$credentials");

      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(name);

        String photourl = "uploads/default.png";

        await credentials.user?.updatePhotoURL(photourl);
        //get server photo url
        //get user photo url
        toastinfo(
          'Email has been sent to verify your account.Please open that email and confirm your identity',
        );
        context.pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastinfo('This password is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastinfo('This email address has already been registered');
      } else if (e.code == 'user-not-found') {
        toastinfo('user not found');
      }
      log(e.code);
    } catch (e) {
      if (kDebugMode) {
        log("$e");
      }
    }

    //show the register page
    ref.read(appLoaderProvider.notifier).setLoadervalue(false);
  }
}
