import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/features/welcome/notifier/welcome_notifier.dart';
import 'package:ulearning_app/features/welcome/widgets.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProviderProvider);
    return Container(
      color: AppColors.primaryBackground,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.center,
              children: [
                //showing our three welcome pages
                PageView(
                  onPageChanged: (value) {
                    ref
                        .read(indexDotProviderProvider.notifier)
                        .changeIndex(value);
                  },
                  controller: controller,
                  children: [
                    //first page
                    Apponboardingpage(
                      controller: controller,
                      imagepath: ImageRes.reading,
                      title: 'First see learning',
                      subtitle:
                          'Forget about the paper now learning all knowledge in one learning',
                      index: 1,
                    ),
                    //second page
                    Apponboardingpage(
                      controller: controller,
                      imagepath: ImageRes.man,
                      title: 'Connect with everyone',
                      subtitle:
                          'Always keep in touch with your tutor and friends. Lets get connected',
                      index: 2,
                    ),
                    Apponboardingpage(
                      controller: controller,
                      imagepath: ImageRes.lapwork,
                      title: 'Always Fascinated Learing',
                      subtitle:
                          'Anywhere anytime. The time is at your discretion. So study wherever you can',
                      index: 3,
                    ),
                  ],
                ),
                //for showing dots
                Positioned(
                  bottom: 50,
                  child: DotsIndicator(
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    position: index,
                    decorator: DotsDecorator(
                      size: Size.square(9),
                      activeSize: Size(36, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
