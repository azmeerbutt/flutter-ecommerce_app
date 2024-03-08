import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/common/widgets/common_widgets.dart';
import 'package:learn_it/pages/profile/profile_Widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildProfileAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50.h),
          // width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              profileAndEditButton(context),
              buildText(
                  text: 'Azmeer', fontSize: 16.sp, fontWeight: FontWeight.bold),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 30.w,
                ),
                child: buildListView(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
