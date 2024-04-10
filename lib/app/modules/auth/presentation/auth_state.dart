import '../../../commons/helpers/presentation/mvvm/viewmodel_state.dart';
import '../domain/entities/registered_user_entity.dart';

class AuthState extends ViewModelState {
  factory AuthState.initial() => const AuthState();
  final bool hasError;
  final bool isLoading;
  final RegisteredUserEntity? user;

  const AuthState({
    this.hasError = false,
    this.isLoading = false,
    this.user,
  });

  AuthState copyWith({
    bool? hasError,
    bool? isLoading,
    RegisteredUserEntity? user,
  }) {
    return AuthState(
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}
