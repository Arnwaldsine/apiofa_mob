import 'dart:convert';

class RefreshToken {
  final String userId;
  final String expiredToken;
  final String refreshToken;

  RefreshToken({
    required this.userId,
    required this.expiredToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'expiredToken': expiredToken,
      'refreshToken': refreshToken,
    };
  }

  factory RefreshToken.fromMap(Map<String, dynamic> map) {
    return RefreshToken(
      userId: map['userId'] ?? '',
      expiredToken: map['expiredToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RefreshToken.fromJson(String source) => RefreshToken.fromMap(json.decode(source));

  RefreshToken copyWith({
    String? userId,
    String? expiredToken,
    String? refreshToken,
  }) {
    return RefreshToken(
      userId: userId ?? this.userId,
      expiredToken: expiredToken ?? this.expiredToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
