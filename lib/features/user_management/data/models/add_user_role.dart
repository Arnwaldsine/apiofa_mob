
import 'dart:convert';

class AddUserToRoleDto {
  final String email;
  final String roleName;

  AddUserToRoleDto({
    required this.email,
    required this.roleName,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'roleName': roleName,
    };
  }
  factory AddUserToRoleDto.fromMap(Map<String, dynamic> map) {
    return AddUserToRoleDto(
      email: map['email'] ?? '',
      roleName: map['roleName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddUserToRoleDto.fromJson(String source) =>
      AddUserToRoleDto.fromMap(json.decode(source));

  AddUserToRoleDto copyWith({
    String? email,
    String? roleName,
  }) {
    return AddUserToRoleDto(
      email: email ?? this.email,
      roleName: roleName ?? this.roleName,
    );
  }
}

// Validation methods

String? validateEmail(String value) {
  if (value.isEmpty) {
    return "El correo electrónico es obligatorio.";
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  if (!emailRegex.hasMatch(value)) {
    return "El correo electrónico no es válido.";
  }
  return null;
}

String? validateRoleName(String value) {
  if (value.isEmpty) {
    return "El nombre del rol es obligatorio.";
  }
  return null;
}
