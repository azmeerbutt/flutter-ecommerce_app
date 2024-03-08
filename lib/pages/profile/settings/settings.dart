import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_it/common/routes/names.dart';
import 'package:learn_it/common/values/constants.dart';
import 'package:learn_it/common/widgets/common_widgets.dart';
import 'package:learn_it/pages/application/bloc/app_blocs.dart';
import 'package:learn_it/pages/application/bloc/app_events.dart';
import 'package:learn_it/pages/home/bloc/home_blocs.dart';
import 'package:learn_it/pages/home/bloc/home_events.dart';
import 'package:learn_it/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:learn_it/pages/profile/settings/bloc/settings_states.dart';

import '../../../global.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    context.read<HomeBloc>().add(const TriggerSlideEvent(0));
    Global.storageServic.remove(AppConstant.STORAGE_USER_TOKEN_KEY);
    Global.storageServic.remove(AppConstant.STORAGE_USER_PROFILE_KEY);
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.LOGIN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBarWithBack('Settings'),
        body: SingleChildScrollView(
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext contex) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text('Logout'),
                              content: const Text('Confirm Logout'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel')),
                                TextButton(
                                    onPressed: () => removeUserData(),
                                    child: const Text('Logout')),
                              ],
                            );
                          });
                    },
                    child: Container(
                      height: 100.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/icons/Logout.png'),
                        fit: BoxFit.fitHeight,
                      )),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
