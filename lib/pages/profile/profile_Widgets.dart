import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/common/routes/routes.dart';

import '../../common/widgets/common_widgets.dart';

AppBar buildProfileAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Container(
      margin: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconButton(
            iconpath: 'assets/icons/menu.png',
            width: 18.w,
            height: 12.h,
          ),
          buildText(
              text: 'Profile', fontSize: 16.sp, fontWeight: FontWeight.bold),
          buildIconButton(
            iconpath: 'assets/icons/more-vertical.png',
            width: 24.w,
            height: 24.h,
          ),
        ],
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.black12,
        height: 1.0,
      ),
    ),
  );
}

Widget profileAndEditButton(BuildContext context) {
  return Container(
    alignment: Alignment.bottomRight,
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
          image: AssetImage('assets/icons/headpic.png'), fit: BoxFit.cover),
    ),
    child: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 5.w),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Image(
          width: 25.w,
          height: 25.h,
          image: const AssetImage('assets/icons/edit_2.png'),
        ),
      ),
    ),
  );
}

var imageInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imageInfo.length,
          (index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, AppRoutes.SETTINGS),
                child: Container(
                  padding: EdgeInsets.only(bottom: 15.h),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        padding: const EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Image(
                          image: AssetImage(
                              'assets/icons/${imageInfo.values.elementAt(index)}'),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      buildText(
                        text: imageInfo.keys.elementAt(index),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}
