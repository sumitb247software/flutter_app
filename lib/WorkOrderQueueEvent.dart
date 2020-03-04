abstract class WorkOrderQueueEvent {}

class QueueLoadingEvent extends WorkOrderQueueEvent {}

class QueueLoadedEvent extends WorkOrderQueueEvent {}

class QueueLoadFailure extends WorkOrderQueueEvent {
  final String error;

  QueueLoadFailure(this.error);
}
