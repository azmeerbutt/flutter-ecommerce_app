import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/common/entities/entities.dart';
import 'package:learn_it/common/routes/names.dart';
import 'package:learn_it/pages/home/bloc/home_blocs.dart';
import 'package:learn_it/pages/home/home_controller.dart';
import 'bloc/home_states.dart';
import 'home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem? profile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profile = HomeController(context: context).profile;
  }

  @override
  Widget build(BuildContext context) {
    return profile != null
        ? SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.courseItem.isEmpty) {
                    HomeController(context: context).init();
                  }
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(padding: EdgeInsets.only(top: 10.h)),
                        SliverAppBar(
                          scrolledUnderElevation: 0,
                          titleSpacing: 0.0,
                          floating: true,

                          title: buildHomeAppBr(profile!),
                          // bottom: PreferredSize(
                          //   preferredSize: const Size.fromHeight(1.0),
                          //   child: Container(
                          //     color: Colors.black12,
                          //     height: 1.h,
                          //   ),
                          // ),
                        ),
                        SliverPadding(padding: EdgeInsets.only(top: 15.h)),
                        SliverToBoxAdapter(child: sliderView(context, state)),
                        SliverPadding(padding: EdgeInsets.only(top: 25.h)),
                        SliverToBoxAdapter(child: menuView()),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 50.h),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                                childCount: state.courseItem.length,
                                (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.PRODUCT_DETAIL,
                                      arguments: {
                                        "id": state.courseItem
                                            .elementAt(index)
                                            .id,
                                      });
                                },
                                child: productGridView(state.courseItem[index]),
                              );
                            }),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 50,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 0.8),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        : Container();
  }
}
