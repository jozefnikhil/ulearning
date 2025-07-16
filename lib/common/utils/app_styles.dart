import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';

class AppTheme {
  static ThemeData appthemedata = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.primaryText),
    ),
  );
}
