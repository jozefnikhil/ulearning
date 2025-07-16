import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/globalloader/global_loader.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_text_fields.dart';
import 'package:ulearning_app/common/widgets/appbar_widgets.dart';
import 'package:ulearning_app/common/widgets/buttons_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/features/sign%20up/provider/notifier/register_notifier.dart';
import 'package:ulearning_app/features/sign%20up/controller/sign_up_controllers.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);
    SignUpControllers controllers = SignUpControllers(ref: ref);
    //regProvider.
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          appBar: buidAppbar(title: 'Sign Up'),
          backgroundColor: AppColors.primaryBackground,
          body:
              loader == false
                  ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        Text14Normal(
                          text: "Enter your details below & free sign up",
                        ),
                        SizedBox(height: 50.h),
                        //username textbox
                        appTextfield(
                          text: 'User name',
                          iconName: ImageRes.profile,
                          hinttext: 'Enter your user name',
                          func:
                              (val) => ref
                                  .watch(registerNotifierProvider.notifier)
                                  .onUsernamechange(val),
                        ),
                        SizedBox(height: 20.h),
                        //email textbox
                        appTextfield(
                          text: 'Email',
                          iconName: ImageRes.profile,
                          hinttext: 'Enter your email address',
                          func:
                              (val) => ref
                                  .watch(registerNotifierProvider.notifier)
                                  .onUseremailchange(val),
                        ),
                        SizedBox(height: 20.h),
                        //password textbox
                        appTextfield(
                          text: 'Password',
                          iconName: ImageRes.lock,
                          hinttext: 'Enter your password',
                          obscuretext: true,
                          func:
                              (val) => ref
                                  .watch(registerNotifierProvider.notifier)
                                  .onUserpasswordchange(val),
                        ),
                        SizedBox(height: 20.h),
                        //confirm your password textbox
                        appTextfield(
                          text: 'Confirm Password',
                          iconName: ImageRes.lock,
                          hinttext: 'Confirm your password',
                          obscuretext: true,
                          func:
                              (val) => ref
                                  .watch(registerNotifierProvider.notifier)
                                  .onUserconfirmpasswordchange(val),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(left: 25.w),
                            child: Text14Normal(
                              text:
                                  'By creating an account you are agreeing with our terms and conditions',
                            ),
                          ),
                        ),

                        SizedBox(height: 100.h),
                        //app sign up button
                        AppButton(
                          buttonName: "Register",
                          isLogin: true,
                          context: context,
                          func: () {
                            final state = ref.read(registerNotifierProvider);
                            // Log the values
                            debugPrint("Tapped Register button");
                            debugPrint("Username: ${state.username}");
                            debugPrint("Email: ${state.email}");
                            debugPrint("Password: ${state.password}");
                            debugPrint(
                              "Confirm Password: ${state.confirmpassword}",
                            );
                            controllers.handleSignup();
                          },
                        ),
                      ],
                    ),
                  )
                  : Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                      color: AppColors.primaryElement,
                    ),
                  ),
        ),
      ),
    );
  }
}
