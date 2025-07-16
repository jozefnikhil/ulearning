import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';

Widget text24Normal({
  String text = '',
  Color color = AppColors.primaryText,
  FontWeight fontweight = FontWeight.normal,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(color: color, fontSize: 24, fontWeight: fontweight),
  );
}

class Text16Normal extends StatelessWidget {
  final String? text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  const Text16Normal({
    super.key,
    this.color = AppColors.primarySecondaryElementText,
    this.text = '',
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: 16.sp, fontWeight: fontWeight),
    );
  }
}

class Text14Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  const Text14Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryThreeElementText,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(color: color, fontSize: 16, fontWeight: fontWeight),
    );
  }
}

class Text10Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text10Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryThreeElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class Text11Normal extends StatelessWidget {
  final String text;
  final Color color;
  const Text11Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 11.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

class FadeText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  const FadeText({
    super.key,
    this.fontSize = 10,
    this.text = '',
    this.color = AppColors.primaryElementText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: color,

        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget textUnderline({String text = 'Your text'}) {
  return GestureDetector(
    onTap: () {},
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
      ),
    ),
  );
}

class Text13Normal extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  const Text13Normal({
    super.key,
    this.text = '',
    this.color = AppColors.primaryText,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: 13.sp, fontWeight: fontWeight),
    );
  }
}
