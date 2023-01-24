
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/helper/constant.dart';

class DioHelper{
 static Dio ?  dio;
static init (){
  dio = Dio(
    BaseOptions(
      baseUrl:baseUrl ,
      receiveDataWhenStatusError: true,
    ),
  );
}
   static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  })async{
    return await
    dio!.get(url,queryParameters:query );
  }
}