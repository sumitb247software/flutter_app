abstract class WorkTypeEvent {}

class WorkTypeLoadingEvent extends WorkTypeEvent {}

class WorkTypeLoadedEvent extends WorkTypeEvent {}

class WorkTypeLoadFailure extends WorkTypeEvent {
  final String error;

  WorkTypeLoadFailure(this.error);
}
