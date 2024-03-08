import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/common/routes/names.dart';
import 'package:learn_it/global.dart';
import 'package:learn_it/pages/application/app_page.dart';
import 'package:learn_it/pages/application/bloc/app_blocs.dart';
import 'package:learn_it/pages/home/bloc/home_blocs.dart';
import 'package:learn_it/pages/home/home_page.dart';
import 'package:learn_it/pages/login/bloc/login_blocs.dart';
import 'package:learn_it/pages/login/login.dart';
import 'package:learn_it/pages/payment/bloc/paywebview_blocs.dart';
import 'package:learn_it/pages/product/bloc/product_blocs.dart';
import 'package:learn_it/pages/product/product_page.dart';
import 'package:learn_it/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:learn_it/pages/profile/settings/settings.dart';
import 'package:learn_it/pages/search/bloc/search_blocs.dart';
import 'package:learn_it/pages/search/search_page.dart';
import 'package:learn_it/pages/signup/bloc/register_blocs.dart';
import 'package:learn_it/pages/signup/register.dart';
import 'package:learn_it/pages/welcome/bloc/welcome_blocs.dart';
import 'package:learn_it/pages/welcome/welcome.dart';

import '../../pages/payment/paywebview.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.LOGIN,
        page: const Login(),
        bloc: BlocProvider(create: (_) => LoginBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const AppPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageEntity(
        route: AppRoutes.HOME,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SEARCH,
        page: const SearchPage(),
        bloc: BlocProvider(create: (_) => SearchBloc()),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const Settings(),
        bloc: BlocProvider(create: (_) => SettingsBloc()),
      ),
      PageEntity(
        route: AppRoutes.PRODUCT_DETAIL,
        page: const ProductPage(),
        bloc: BlocProvider(create: (_) => ProductBloc()),
      ),
      PageEntity(
        route: AppRoutes.PAY_WEB_VIEW,
        page: const PayView(),
        bloc: BlocProvider(create: (_) => PayViewBlocs()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRoutSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageServic.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageServic.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => const AppPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const Login(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    return MaterialPageRoute(builder: (_) => const Login(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}
