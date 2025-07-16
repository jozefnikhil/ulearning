import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/features/application/provider/notifier/application_nav_notifier.dart';
import 'package:ulearning_app/features/application/view/widgets/widgets.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(applicationNavNotifierProvider);
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          body: appscreens(index: index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 65.h,
            decoration: appboxshadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: index,
              items: bottomTabs,
              onTap: (value) {
                ref
                    .read(applicationNavNotifierProvider.notifier)
                    .changeindex(value);

                log('$value');
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourElementText,
            ),
          ),
        ),
      ),
    );
  }
}
