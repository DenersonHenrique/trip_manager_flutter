import '../../../commons/helpers/presentation/mvvm/mvvm.dart';

class SplashState extends ViewModelState {
  factory SplashState.initial() => const SplashState();

  final bool hasError;
  final bool isLoading;

  const SplashState({
    this.hasError = false,
    this.isLoading = false,
  });

  SplashState copyWith({
    bool? hasError,
    bool? isLoading,
  }) {
    return SplashState(
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
