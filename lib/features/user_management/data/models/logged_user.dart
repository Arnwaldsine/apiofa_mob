import 'dart:convert';

class LoggedUser{
  final String userId;
  final String token;
  final String refreshToken;

  LoggedUser({
    required this.userId,
    required this.token,
    required this.refreshToken,
  });

  factory LoggedUser.fromMap(Map<String, dynamic> map) {
    return LoggedUser(
      userId: map['userId'] ?? '',
      token: map['token'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }
  factory LoggedUser.fromJson(String source) => LoggedUser.fromMap(json.decode(source));
  
    
}