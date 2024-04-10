import '../../../commons/helpers/presentation/mvvm/mvvm.dart';

class AuthState extends ViewModelState {
  final String message;

  const AuthState({this.message = ''});

  factory AuthState.unauthenticated({String message = ''}) =>
      AuthState(message: message);

  factory AuthState.authenticated() => const AuthState();

  factory AuthState.failure({String message = ''}) =>
      AuthState(message: message);
}
