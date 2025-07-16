import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/common/utils/image_res.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
        text: "Hello, ",
        color: AppColors.primaryThreeElementText,
        fontweight: FontWeight.bold,
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    log('usrname');
    return Container(
      child: text24Normal(
        text: Global.storageService.getUserProfile().name!,
        fontweight: FontWeight.bold,
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;
  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 325.w,
          height: 160.h,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              ref.read(homescreenBannerDotsProvider.notifier).setIndex(index);
              log("$index");
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        //dots
        DotsIndicator(
          dotsCount: 3,
          mainAxisAlignment: MainAxisAlignment.center,
          position: ref.watch(homescreenBannerDotsProvider),
          decorator: DotsDecorator(
            size: Size.square(9),
            activeSize: Size(36, 8),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}

Widget bannerContainer({String? imagePath}) {
  return Container(
    width: 325.w,
    height: 140.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      image: DecorationImage(image: NetworkImage(imagePath!), fit: BoxFit.fill),
    ),
  );
}

AppBar homeAppbar(WidgetRef ref) {
  var profilestate = ref.watch(homeUserProfileProvider);

  return AppBar(
    backgroundColor: Colors.white,
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppImage(imagepath: ImageRes.menu, height: 50.h, width: 25.w),

          // ↓ Show only one AppBoxDecorationImage depending on state
          profilestate.when(
            data:
                (value) => AppBoxDecorationImage(
                  imagePath: "${AppConstants.SERVER_API_URL}${value.avatar!}",
                ),
            error:
                (err, stack) => const AppBoxDecorationImage(
                  imagePath: ImageRes.profile, // fallback to asset image
                ),
            loading:
                () => const AppBoxDecorationImage(
                  imagePath: ImageRes.profile, // show default during loading
                ),
          ),
        ],
      ),
    ),
  );
}

class HomeMenubar extends StatelessWidget {
  const HomeMenubar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //see all course
        Container(
          margin: EdgeInsets.only(top: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text16Normal(
                text: 'Choose your course',
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
              ),

              //course item button
              GestureDetector(
                child: Text10Normal(
                  text: 'See All',
                  color: AppColors.primaryThreeElementText,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Container(
              decoration: appboxshadow(
                color: AppColors.primaryElement,
                radius: 7.w,
              ),
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 5.h,
                bottom: 5.h,
              ),
              child: Text11Normal(text: 'All'),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Text11Normal(
                text: 'Popular',
                color: AppColors.primaryThreeElementText,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w),
              child: Text11Normal(
                text: 'Newest',
                color: AppColors.primaryThreeElementText,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  final WidgetRef ref;
  const CourseItemGrid({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    final courseState = ref.watch(homeCourseListProvider);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0),
      child: courseState.when(
        data:
            (data) => GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.6,
              ),
              itemCount: data?.length,
              itemBuilder: (_, int index) {
                return AppBoxDecorationImage(
                  imagePath:
                      "${AppConstants.IMAGE_UPLOADS_PATH}${data![index].thumbnail!}",
                  fit: BoxFit.fitHeight,
                  courseItem: data[index],
                  func: () {
                    Navigator.of(context).pushNamed(
                      "/course_Detail",
                      arguments: {"id": data[index].id.toString()},
                    );
                    log('hloooo');
                  },
                );
              },
            ),
        error: (error, stackTrace) {
          log(error.toString());
          log(stackTrace.toString());
          return Center(child: Text10Normal(text: "Error Loading Data"));
        },
        loading: () => Center(child: Text10Normal(text: 'Loading...')),
      ),
    );
  }
}
