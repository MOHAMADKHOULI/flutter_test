import 'package:dio/dio.dart';

getData() async {
  Dio dio = Dio();
  Response response = await dio.get('https://dummyjson.com/products/1');
  return response.data;
}
