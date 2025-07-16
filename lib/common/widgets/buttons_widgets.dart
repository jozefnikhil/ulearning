import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';




class AppButton extends StatelessWidget {
  final String buttonName;
  final double width;
  final double height;
  final bool isLogin;
  final BuildContext? context;
 final void Function()? func;
  const AppButton({super.key,this.width = 325,this.height = 50,this.isLogin = true,this.func,this.context,this.buttonName = ''});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      decoration: appboxshadow(
        border: Border.all(color: AppColors.primaryFourElementText),
        color: isLogin ? AppColors.primaryElement : AppColors.primaryBackground,
      ),
      child: Center(
        child: Text16Normal(
          text: buttonName,
          color: isLogin ? AppColors.primaryBackground : AppColors.primaryText,
        ),
      ),
    ),
  );
  }
}