abstract class WorkOrderQueueState {}

class QueueLoading extends WorkOrderQueueState {}

class QueueDataLoaded extends WorkOrderQueueState {}

class QueueDataFetchError extends WorkOrderQueueState {
  final String msg;

  QueueDataFetchError(this.msg);
}
