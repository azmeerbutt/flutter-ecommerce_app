import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/common/entities/entities.dart';
import 'package:learn_it/common/widgets/common_widgets.dart';
import 'package:learn_it/pages/home/bloc/home_blocs.dart';
import 'package:learn_it/pages/home/bloc/home_events.dart';
import 'package:learn_it/pages/home/bloc/home_states.dart';
import '../../common/values/constants.dart';

Widget buildHomeAppBr(UserItem profile) {
  return Container(
    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            buildIconButtonWithNetworkImage(
              iconpath: AppConstant.BASE_URL + profile.avatar!,
              width: 50.w,
              height: 50.h,
            ),
            Column(
              children: [
                buildText(
                  text: 'Welcome,',
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                buildText(
                  text: profile.name!,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
        buildIconButton(
          iconpath: 'assets/icons/heart.png',
          width: 40.w,
          height: 40.h,
        ),
      ],
    ),
  );
}

Widget sliderView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        margin: EdgeInsets.only(top: 10.h),
        height: 200.h,
        child: PageView(
          onPageChanged: (value) =>
              context.read<HomeBloc>().add(TriggerSlideEvent(value)),
          children: [
            _sliderContainer(imgPath: 'assets/icons/sale_banner1.png'),
            _sliderContainer(imgPath: 'assets/icons/image_1.png'),
            _sliderContainer(imgPath: 'assets/icons/image_2.png'),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          activeColor: Colors.black,
          activeSize: const Size(18.0, 5.0),
          color: Colors.grey,
          size: const Size.square(5.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    ],
  );
}

Widget _sliderContainer({String? imgPath}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2.w),
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(imgPath!), fit: BoxFit.fill),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
  );
}

Widget menuView() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 7.w),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(
                  text: 'Choose your outfits',
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold),
              GestureDetector(
                child: buildText(
                  text: 'View All',
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _reuseableMenuText(
                  text: 'Newest',
                  textColor: Colors.white,
                  backgroundColor: Colors.black),
              _reuseableMenuText(
                text: 'Offer',
              ),
              _reuseableMenuText(
                text: 'Populor',
              ),
              _reuseableMenuText(
                text: 'Feature',
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _reuseableMenuText({
  String text = '',
  Color textColor = Colors.grey,
  Color backgroundColor = Colors.white,
}) {
  return Container(
    // margin: EdgeInsets.only(right: 15.w),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(color: Colors.grey),
    ),
    padding: EdgeInsets.only(
      left: 15.w,
      top: 5.h,
      bottom: 5.h,
      right: 15.w,
    ),
    child: buildText(text: text, color: textColor),
  );
}

Widget productGridView(CourseItem item) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 7.w),
    child: Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(AppConstant.SERVER_UPLOAD + item.thumbnail!),
            ),
          ),
        ),
        Positioned(
          top: 180,
          child: Opacity(
            opacity: 1,
            child: Container(
              width: 130.w,
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(0, 10),
                      blurRadius: 3,
                      spreadRadius: -3)
                ],
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.left,
                    softWrap: false,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          buildIconButton(
                            iconpath: 'assets/icons/price.png',
                            width: 15.w,
                            height: 15.h,
                          ),
                          Text(
                            '\$',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            item.price ?? "0.0",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      buildIconButton(
                        iconpath: 'assets/icons/heart(1).png',
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
