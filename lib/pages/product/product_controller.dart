import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learn_it/common/apis/product_api.dart';
import 'package:learn_it/common/entities/course.dart';
import 'package:learn_it/pages/product/bloc/product_blocs.dart';
import 'package:learn_it/pages/product/bloc/product_events.dart';

import '../../common/routes/names.dart';

class ProductController {
  final BuildContext context;
  ProductController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    loadAllData(args["id"]);
  }

  void loadAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await ProductAPI.productDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<ProductBloc>().add(TriggerProductEvent(result.data!));
      }
    } else {}
  }

  Future<void> goBuy(BuildContext context, int? id) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await ProductAPI.productPay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      if (context.mounted) {
        Navigator.of(context).pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {
          "url": url,
        });
      }
      print(url);
    }
  }
}
