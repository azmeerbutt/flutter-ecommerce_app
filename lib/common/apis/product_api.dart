import 'package:learn_it/common/entities/course.dart';
import 'package:learn_it/common/entities/entities.dart';
import 'package:learn_it/common/utils/http_util.dart';

class ProductAPI {
  static Future<CourseListResponseEntity> productList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> productDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/courseDetail',
      queryParameters: params?.toJson(),
    );

    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<BaseResponseEntity> productPay(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/checkout',
      queryParameters: params?.toJson(),
    );

    return BaseResponseEntity.fromJson(response);
  }
}
