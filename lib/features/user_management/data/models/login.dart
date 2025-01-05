import 'dart:convert';

class Login {
  final String email;
  final String password;
  final String role;

  Login({
    required this.email,
    required this.password,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'role': role,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));

  Login copyWith({
    String? email,
    String? password,
    String? role,
  }) {
    return Login(
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
    );
  }

  String? validateEmail() {
    if (email.isEmpty) {
      return 'El correo electrónico es obligatorio';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'El correo electrónico no es válido';
    }
    return null;
  }

  String? validatePassword() {
    if (password.isEmpty) {
      return 'La contraseña es obligatoria';
    }
    return null;
  }
}
