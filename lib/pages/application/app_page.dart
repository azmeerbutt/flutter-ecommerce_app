import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/pages/application/app_widgets.dart';
import 'package:learn_it/pages/application/bloc/app_blocs.dart';
import 'package:learn_it/pages/application/bloc/app_events.dart';
import 'package:learn_it/pages/application/bloc/app_states.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.transparent,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBody: true,
              body: buildPages(state.index),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Container(
                margin: EdgeInsets.symmetric(horizontal: 18.w),
                // decoration: const BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(20)),
                //   boxShadow: [
                //     BoxShadow(
                //         color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                //   ],
                // ),
                child: BottomNavigationBar(
                  onTap: (value) {
                    context.read<AppBloc>().add(TriggerAppEvent(value));
                  },
                  backgroundColor: Colors.black,
                  currentIndex: state.index,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: Colors.black,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
