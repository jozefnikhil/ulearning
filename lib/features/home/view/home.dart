import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/search_widget.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';
import 'package:ulearning_app/features/home/view/widgets/home_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = PageController(
      initialPage: ref.watch(homescreenBannerDotsProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppbar(ref),
      body: RefreshIndicator(
        onRefresh:
            () =>
                ref.refresh(homeCourseListProvider.notifier).fetchCourseList(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: ListView(
            children: [
              SizedBox(height: 20.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: const HelloText(),
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: const UserName(),
              ),
              SizedBox(height: 20.h),
              searchBar(),
              SizedBox(height: 20.h),
              HomeBanner(ref: ref, controller: controller),
              const HomeMenubar(),
              CourseItemGrid(ref: ref),
            ],
          ),
        ),
      ),
    );
  }
}
