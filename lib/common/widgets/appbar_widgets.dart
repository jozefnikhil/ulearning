import 'package:flutter/material.dart';
import 'package:ulearning_app/common/utils/appcolors.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

AppBar buidAppbar({String title = ''}) {
  return AppBar(
    title: Text16Normal(text: title),
    centerTitle: true,
    bottom: PreferredSize(preferredSize: Size.fromHeight(1), child: Divider()),
    backgroundColor: AppColors.primaryBackground,
  );
}

AppBar buildGlobalAppbar({String title = ''}) {
  return AppBar(title: Text16Normal(text: title));
}
