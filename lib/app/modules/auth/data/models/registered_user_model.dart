import 'dart:convert';

import '../../domain/entities/registered_user_entity.dart';

class RegisteredUserModel extends RegisteredUserEntity {
  const RegisteredUserModel({
    required super.idToken,
    required super.email,
    required super.refreshToken,
    required super.expiresIn,
    required super.localId,
  });

  factory RegisteredUserModel.fromMap(Map<String, dynamic> map) =>
      RegisteredUserModel(
        idToken: map['idToken'],
        email: map['email'],
        refreshToken: map['refreshToken'],
        expiresIn: map['expiresIn'],
        localId: map['localId'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idToken'] = idToken;
    data['email'] = email;
    data['refreshToken'] = refreshToken;
    data['expiresIn'] = expiresIn;
    data['localId'] = localId;
    return data;
  }

  factory RegisteredUserModel.fromEntity(RegisteredUserEntity entity) =>
      RegisteredUserModel(
        idToken: entity.idToken,
        email: entity.email,
        refreshToken: entity.refreshToken,
        expiresIn: entity.expiresIn,
        localId: entity.localId,
      );

  factory RegisteredUserModel.fromJson(String source) =>
      RegisteredUserModel.fromMap(json.decode(source));
}
