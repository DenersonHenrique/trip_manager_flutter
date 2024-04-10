import 'dart:convert';

import '../../domain/entities/login_params_entity.dart';

class UserModel extends LoginParamsEntity {
  const UserModel({
    required super.email,
    required super.password,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        email: map['email'],
        password: map['password'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  factory UserModel.fromEntity(LoginParamsEntity entity) => UserModel(
        email: entity.email,
        password: entity.password,
      );

  Map<String, dynamic> get toMap => {
        'email': email,
        'password': password,
      };

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
