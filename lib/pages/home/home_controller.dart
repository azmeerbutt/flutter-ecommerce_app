import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_it/common/apis/product_api.dart';
import 'package:learn_it/common/entities/entities.dart';
import 'package:learn_it/global.dart';
import 'package:learn_it/pages/home/bloc/home_blocs.dart';
import 'package:learn_it/pages/home/bloc/home_events.dart';

class HomeController {
  late BuildContext context;

  UserItem? get profile => Global.storageServic.getUserProfile();

  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (Global.storageServic.getUserToken().isNotEmpty) {
      var result = await ProductAPI.productList();
      print(result.code);
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomeBloc>().add(HomeCourseItemEvent(result.data!));
        }
      } else {
        print(result.code);
      }
    } else {
      print('user has already logged out...');
    }
  }
}
