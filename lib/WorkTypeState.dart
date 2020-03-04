class WorkTypeState {}

class WorkTypeLoading extends WorkTypeState {}

class WorkTypeDataLoaded extends WorkTypeState {}

class WorkTypeDataFetchError extends WorkTypeState {
  final String msg;

  WorkTypeDataFetchError(this.msg);
}
