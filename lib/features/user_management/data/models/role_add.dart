import 'dart:convert';


class RoleAdd{
  final int id;
  final String name;

  RoleAdd({
    required this.id,
    required this.name,
  });

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,
    };
  }

  factory RoleAdd.fromMap(Map<String,dynamic> map){
    return RoleAdd(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleAdd.fromJson(String source) => RoleAdd.fromMap(json.decode(source));

  RoleAdd copyWith({
    int? id,
    String? name,
  }){
    return RoleAdd(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  String? validateName(){
    if(name.isEmpty){
      return 'Introduzca un nombre';
    }
    return null;
  }

  String? validateId(){
    if(id <= 0){
      return 'ID debe ser un número positivo';
    }
    return null;
  }

}