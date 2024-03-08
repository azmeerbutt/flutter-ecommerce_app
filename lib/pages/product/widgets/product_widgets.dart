import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/common/widgets/common_widgets.dart';

AppBar buildProductAppBar() {
  return AppBar(
    title: Center(child: buildText(text: 'Details')),
    actions: [buildIconButton(iconpath: 'assets/icons/heart.png')],
  );
}

Widget reuseableSizeText({
  String text = '',
  Color textColor = Colors.black,
  Color backgroundColor = Colors.white,
}) {
  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      //  borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: Colors.black),
    ),
    padding: EdgeInsets.only(
      left: 15.w,
      top: 5.h,
      bottom: 5.h,
      right: 15.w,
    ),
    child: buildText(
      text: text,
      color: textColor,
      fontSize: 18.sp,
    ),
  );
}
