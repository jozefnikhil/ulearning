import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/features/home/view/home.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: _bottomContainer(colors: AppColors.primaryFourElementText),
    activeIcon: _bottomContainer(colors: AppColors.primaryElement),

    label: 'Home',
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(
      imagepath: ImageRes.search,
      colors: AppColors.primaryFourElementText,
    ),
    activeIcon: _bottomContainer(
      colors: AppColors.primaryElement,
      imagepath: ImageRes.search,
    ),

    label: 'Search',
    backgroundColor: AppColors.primaryBackground,
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(
      imagepath: ImageRes.play,
      colors: AppColors.primaryFourElementText,
    ),
    activeIcon: _bottomContainer(
      colors: AppColors.primaryElement,
      imagepath: ImageRes.play,
    ),

    label: 'Play',
    backgroundColor: AppColors.primaryBackground,
  ),
  BottomNavigationBarItem(
    icon: _bottomContainer(
      imagepath: ImageRes.message,
      colors: AppColors.primaryFourElementText,
    ),
    activeIcon: _bottomContainer(
      colors: AppColors.primaryElement,
      imagepath: ImageRes.message,
    ),

    label: 'Chat',
    backgroundColor: AppColors.primaryBackground,
  ),

  BottomNavigationBarItem(
    icon: _bottomContainer(
      imagepath: ImageRes.profile,
      colors: AppColors.primaryFourElementText,
    ),
    activeIcon: _bottomContainer(
      colors: AppColors.primaryElement,
      imagepath: ImageRes.profile,
    ),

    label: 'Profile',
    backgroundColor: AppColors.primaryBackground,
  ),
];

Widget _bottomContainer({
  double width = 15,
  double height = 15,
  String imagepath = ImageRes.home,
  Color colors = AppColors.primaryElement,
}) {
  return SizedBox(
    width: 15.w,
    height: 15.w,
    child: appimagewithColor(imagepath: imagepath, colors: colors),
  );
}

Widget appscreens({int index = 0}) {
  List<Widget> screens = [
    Home(),
    Center(
      child: AppImage(imagepath: ImageRes.search, height: 250, width: 250),
    ),
    Center(child: AppImage(imagepath: ImageRes.play, height: 250, width: 250)),
    Center(
      child: AppImage(imagepath: ImageRes.message, height: 250, width: 250),
    ),
    Center(
      child: AppImage(imagepath: ImageRes.profile, height: 250, width: 250),
    ),
  ];

  return screens[index];
}
