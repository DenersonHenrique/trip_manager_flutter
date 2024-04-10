import '../../../commons/helpers/presentation/mvvm/viewmodel_state.dart';

class HomeState extends ViewModelState {
  factory HomeState.initial() => const HomeState();
  final bool hasError;
  final bool isLoading;

  const HomeState({
    this.hasError = false,
    this.isLoading = false,
  });

  HomeState copyWith({
    bool? hasError,
    bool? isLoading,
  }) {
    return HomeState(
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
