class BlocState<T> {
  T? data;
  String? error;
  bool hasData, hasError, waiting;
  BlocState({
    this.data,
    this.error,
    this.hasData = false,
    this.hasError = false,
    this.waiting = false,
  });
}
