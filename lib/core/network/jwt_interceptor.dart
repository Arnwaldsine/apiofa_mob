import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtInterceptor extends Interceptor {
  final FlutterSecureStorage secureStorage;

  JwtInterceptor({required this.secureStorage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Retrieve the token from secure storage
    String? token = await secureStorage.read(key: 'jwt_token');

    // Add the token to the Authorization header
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return super.onRequest(options, handler);
  }
}