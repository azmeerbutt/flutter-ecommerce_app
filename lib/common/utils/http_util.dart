import 'package:dio/dio.dart';
import 'package:learn_it/common/values/constants.dart';
import 'package:learn_it/global.dart';

class HttpUtil{
  static final HttpUtil _instance=HttpUtil._internal();
  factory HttpUtil(){
    return _instance;
  }
  late Dio dio;
  HttpUtil._internal(){
   BaseOptions options=BaseOptions(
    baseUrl: AppConstant.BASE_URL,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {},
    contentType: "application/json: charset=utf-8",
    responseType: ResponseType.json,
   );
   dio=Dio(options);
  }
  Future post(String path,{dynamic data,Map<String,dynamic>? queryParameters,Options? options})async{
    Options requestOption=options??Options();
    requestOption.headers=requestOption.headers??{};
    Map<String,dynamic>? authorization=getAuthHeader();
    if(authorization != null){
      requestOption.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOption,
      );
    return response.data;
  }

  Map<String,dynamic>? getAuthHeader()
  {
    var headers=<String,dynamic>{};
    var accessToken=Global.storageServic.getUserToken();
    if(accessToken.isNotEmpty)
    {
      headers['Authorization']='Bearer $accessToken';
    }
    return headers;
  }
}