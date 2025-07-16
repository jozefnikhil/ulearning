import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/appbar_widgets.dart';
import 'package:ulearning_app/features/course%20detail/controller/course_controller.dart';
import 'package:ulearning_app/features/course%20detail/view/widgets/cours_detail_widget.dart';

class CourseDetail extends ConsumerStatefulWidget {
  const CourseDetail({super.key});

  @override
  ConsumerState<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends ConsumerState<CourseDetail> {
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id['id'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseData = ref.watch(
      courseDetailControllerProvider(index: int.parse(args)),
    );

    var lessonData = ref.watch(
      courseLessonListControllerProvider(index: int.parse(args)),
    );
    return Scaffold(
      appBar: buildGlobalAppbar(title: 'Course detail'),
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              courseData.when(
                data:
                    (data) =>
                        data == null
                            ? SizedBox()
                            : Column(
                              children: [
                                CourseDetailThumbnail(courseItem: data),
                                CourseImageIconText(courseItem: data),
                                CourseDetailDescription(courseItem: data),
                                CourseDetailGoBuyButton(),
                                CourseDetailIncludes(courseItem: data),
                              ],
                            ),
                error:
                    (error, stackTrace) =>
                        Center(child: Text('Error loading course data')),
                loading:
                    () => SizedBox(
                      height: 500.h,
                      child: Center(child: CircularProgressIndicator()),
                    ),
              ),
              // Center(child: Text(data.name!)),
              lessonData.when(
                data:
                    (data) =>
                        data == null
                            ? SizedBox()
                            : LessonInfo(lessonitems: data,ref: ref,),
                error:
                    (error, stackTrace) =>
                        Center(child: Text('Error loading lesson data')),
                loading:
                    () => SizedBox(
                      height: 500.h,
                      child: Center(child: CircularProgressIndicator()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
      
      
    
    //
      //


