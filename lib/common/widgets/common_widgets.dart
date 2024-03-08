import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.black12,
        height: 1.0,
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}

AppBar buildAppBarWithBack(String title) {
  return AppBar(
    title: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 60.w),
      child: buildText(
        text: title,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
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

Widget buildText(
    {String text = '',
    Color color = Colors.black,
    double? fontSize,
    FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

Widget buildTextFormField(
    {String? hint,
    TextEditingController? controller,
    bool obscureText = false,
    required Function() func}) {
  return TextFormField(
    onChanged: func(),
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
        )),
  );
}

Widget buildIconButton(
    {String iconpath = '', double width = 50, double height = 50}) {
  return GestureDetector(
    child: SizedBox(
      width: width.w,
      height: height.h,
      child: Image.asset(iconpath),
    ),
  );
}

Widget buildIconButtonWithNetworkImage(
    {String iconpath = '', double width = 50, double height = 50}) {
  return GestureDetector(
    child: SizedBox(
      width: width.w,
      height: height.h,
      child: Image.network(iconpath),
    ),
  );
}
