class AuthLoadingState {
  const AuthLoadingState(this.state, this.errorMessage);

  final LoadingStateEnum state;
  final String? errorMessage;

  bool get isLoading => state == LoadingStateEnum.loading;

  bool get hasError => state == LoadingStateEnum.error;
}

enum LoadingStateEnum {
  initial,
  loading,
  success,
  error,
}
