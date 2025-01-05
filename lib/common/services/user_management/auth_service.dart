import 'dart:convert';

import 'package:apiofa_mob/core/network/api_client.dart';
import 'package:apiofa_mob/features/user_management/data/models/login.dart';
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

  Future<void> loginUser(Login loginModel) async {
    print(loginModel.toMap());
    try{
       final response = await apiClient.request('auth/login', 
        DioMethod.post,
        param: loginModel.toMap(),
        contentType: 'application/json',
        );
        print(response.data);
        if(response.statusCode == 200 && jsonDecode(response.data)['token']){
            print(jsonDecode(response.data)['token']);
        }else{
          throw Exception("Failed To login");
        }

    } catch(e){
      print('Network error: $e');
    }
  }
}