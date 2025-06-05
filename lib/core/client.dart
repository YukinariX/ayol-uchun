import 'package:dio/dio.dart';

import '../data/models/authorization_models/sign_up_model.dart';
import 'interceptor.dart';

class ApiClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.12:8888/api/v1"))
    ..interceptors.add(AuthInterceptor());

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get("/categories/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Categories error");
    }
  }

  Future<List<dynamic>> fetchCourses({
    Map<String, dynamic>? queryParams,
  }) async {
    var response = await dio.get("/courses/list",queryParameters: queryParams);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Courses error");
    }
  }

  Future<List<dynamic>> fetchSocialMediaAccount() async {
    var response = await dio.get("/social-accounts/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Social Media Account error");
    }
  }

  Future<List<dynamic>> fetchInterview() async {
    var response = await dio.get("/interviews/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Interviews error");
    }
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {'login': login, 'password': password},
    );
    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      print("ishladi:${response.statusCode}");
      return data['accessToken']!;
    } else {
      print(response.statusCode);
      throw Exception("Login error");
    }
  }

  Future<bool> signUp(SignUpModel model) async {
    var response = await dio.post('/auth/register', data: model.toJson());
    if (response.statusCode == 201) {
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  Future<dynamic> fetchUser() async {
    var response = await dio.get("/auth/me");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("User error");
    }
  }
}
