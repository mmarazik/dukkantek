import 'package:dio/dio.dart';

import '../model/user.dart';
import '../error/http_exception.dart';

class DukkanTekHttpClient {
  static const int connectionTimeout = 5000; //5s
  static const int receiveTimeout = 3000;

  static const String apiBaseURL =
      "https://625d5f174c36c7535773fdde.mockapi.io/api/v1/";

  Dio dio = Dio();

  DukkanTekHttpClient() {
    dio.options.baseUrl = apiBaseURL;
    dio.options.connectTimeout = connectionTimeout; //5s
    dio.options.receiveTimeout = receiveTimeout;
  }

  Future<List<User>> getUsers() async {
    List<User> users = [];
    try {
      final Response response = await dio.get('/user');
      if (response.statusCode == 200) {
        var usersData = response.data as List<dynamic>;
        for (var element in usersData) {
          User user = User.fromJson(element);
          users.add(user);
        }
      }
      return users;
    } on DioError catch (e) {
      print(e.message);
      throw HttpException(e.message, e.error);
    }
  }

  Future<bool> signup(User user) async {
    try {
      final Response response = await dio.post("/user", data: user.toJson());
      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } on DioError catch (e) {
      print(e.message);
      throw HttpException(e.message, e.error);
    }
  }
}
