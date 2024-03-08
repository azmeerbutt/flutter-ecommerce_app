import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/pages/home/home_page.dart';
import 'package:learn_it/pages/profile/profile.dart';
import 'package:learn_it/pages/search/search_page.dart';

Widget buildPages(int index) {
  List<Widget> widgets = [
    const HomePage(),
    const SearchPage(),
    const Profile(),
  ];
  return widgets[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: 'home',
    icon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: Colors.white,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'search',
    icon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset(
        "assets/icons/search2.png",
        color: Colors.white,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'profile',
    icon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset("assets/icons/person2.png"),
    ),
    activeIcon: SizedBox(
      width: 20.w,
      height: 20.h,
      child: Image.asset(
        "assets/icons/person2.png",
        color: Colors.white,
      ),
    ),
  ),
];
