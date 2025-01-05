import 'dart:convert';

class Register {
  final String email;
  final String password;
  final String name;
  final List<String> roles;

  Register({
    required this.email,
    required this.password,
    required this.name,
    required this.roles,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'roles': roles,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
      roles: List<String>.from(map['roles'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) => Register.fromMap(json.decode(source));

  Register copyWith({
    String? email,
    String? password,
    String? name,
    List<String>? roles,
  }) {
    return Register(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      roles: roles ?? this.roles,
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
    } else if (password.length < 15 || password.length > 30) {
      return 'La contraseña debe tener entre 15 y 30 caracteres';
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$').hasMatch(password)) {
      return 'La contraseña debe tener minúsculas, mayúsculas, números y caracteres especiales';
    }
    return null;
  }

  String? validateName() {
    if (name.isEmpty) {
      return 'Elija un nombre de usuario';
    } else if (name.length < 8 || name.length > 25) {
      return 'Elija un nombre de entre 8 y 25 caracteres';
    }
    return null;
  }
}
