import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/globalloader/global_loader.dart';
import 'package:ulearning_app/common/routes/app_routes_names.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/appbar_widgets.dart';
import 'package:ulearning_app/common/widgets/buttons_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign%20in/provider/notifier/sign_in_notifier.dart';
import 'package:ulearning_app/features/sign%20in/controller/sign_in_controllers.dart';
import 'package:ulearning_app/features/sign%20in/view/widgets/sign_in_widget.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late final SignInControllers _controllers;

  @override
  void initState() {
    super.initState();

    _controllers = SignInControllers();
  }

  @override
  Widget build(BuildContext context) {
    final signInprovider = ref.watch(signinNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    log(signInprovider.email);
    log(signInprovider.password);
    var navigator = Navigator.of(ref.context);
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          appBar: buidAppbar(title: 'Login'),
          backgroundColor: AppColors.primaryBackground,
          body:
              loader == false
                  ? SingleChildScrollView(
                    child: Column(
                      children: [
                        //more login
                        thirdpartylogin(),
                        //more login options message
                        Text14Normal(text: "Or use your email to login"),
                        SizedBox(height: 50.h),
                        //email textbox
                        appTextfield(
                          text: 'Email',
                          iconName: 'assets/images/user.png',
                          hinttext: 'Enter your email address',
                          controller: _controllers.emailcontroller,
                          func: (val) {
                            ref
                                .watch(signinNotifierProvider.notifier)
                                .onUseremailchange(val);
                          },
                        ),
                        SizedBox(height: 20.h),
                        //password textbox
                        appTextfield(
                          text: 'Password',
                          controller: _controllers.passwordcontroller,
                          iconName: 'assets/images/lock.png',
                          hinttext: 'Enter your password',
                          func: (val) {
                            ref
                                .watch(signinNotifierProvider.notifier)
                                .onUserpasswordchange(val);
                          },
                          obscuretext: true,
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 25),
                            child: textUnderline(text: 'Forgot Password?'),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        //app login button
                        AppButton(
                          buttonName: "Login",
                          context: context,
                          func: () => _controllers.handleSignin(ref),
                        ),
                        SizedBox(height: 20.h),
                        //app register button
                        AppButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func:
                              () => navigator.pushNamed(AppRoutesNames.signup),
                        ),
                      ],
                    ),
                  )
                  : Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryElement,
                      backgroundColor: AppColors.primaryElementText,
                    ),
                  ),
        ),
      ),
    );
  }
}
