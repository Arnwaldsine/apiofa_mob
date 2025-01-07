import 'dart:convert';

import 'package:apiofa_mob/core/network/api_client.dart';
import 'package:apiofa_mob/features/user_management/data/models/login.dart';
import 'package:apiofa_mob/features/user_management/data/models/register.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage secureStorage;
  final ApiClient apiClient;

  AuthService({required this.secureStorage, required this.apiClient});

  Future<void> storeToken(String token) async {
    await secureStorage.write(key: 'jwt_token', value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'jwt_token');
  }

  Future<void> registerUser(Register RegisterModel) async {
    try {
      print("---------------------");
      print(RegisterModel.toJson());
      print("---------------------");

      final response = await apiClient.request('auth/register', DioMethod.post,
          param: RegisterModel.toMap(), contentType: 'application/json');
      print(response.data.toString());
    } on DioException catch(e){
        print('DioError Response: ${e.response!.data}');
        print('DioError Status Code: ${e.response!.statusCode}');      
    }catch (e) {
      print("error: $e");
    }
  }

  Future<void> loginUser(Login loginModel) async {
    try {
      final response = await apiClient.request(
        'auth/login',
        DioMethod.post,
        param: loginModel.toMap(),
        contentType: 'application/json',
      );
      if (response.statusCode == 200 && jsonDecode(response.data)['token']) {
        print(jsonDecode(response.data)['token']);
      } else {
        throw Exception("Failed To login");
      }
    } 
    on DioException catch(e){
        print('DioError Response: ${e.response!.data}');
        print('DioError Status Code: ${e.response!.statusCode}');      
    }
    catch (e) {
      print('Network error: $e');
    }
  }
}
