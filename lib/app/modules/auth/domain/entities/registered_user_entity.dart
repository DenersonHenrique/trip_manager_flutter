import 'package:equatable/equatable.dart';

class RegisteredUserEntity extends Equatable {
  final String? idToken;
  final String? email;
  final String? refreshToken;
  final String? expiresIn;
  final String? localId;

  const RegisteredUserEntity({
    required this.idToken,
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  @override
  List<Object?> get props => [
        idToken,
        email,
        refreshToken,
        expiresIn,
        localId,
      ];
}
