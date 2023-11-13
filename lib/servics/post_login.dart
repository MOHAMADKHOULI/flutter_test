import 'package:dio/dio.dart';
import 'package:flutter_application_1/config/get_it.dart';
import 'package:flutter_application_1/model.dart/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Login(UserModel user) async {
  Dio dio = Dio();
  Response response = await dio.post('https://dummyjson.com/auth/login',
      data: user.toJson(),
      options: Options(headers: {'Content-Type': 'application/json'}));
  if (response.statusCode == 200) {
    config.get<SharedPreferences>().setString('token', response.data['token']);
  } else {
    print('ERROR');
  }
}
