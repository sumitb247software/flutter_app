import 'package:flutter_app/WorkOrderQueueEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'WorkOrderQueueState.dart';

class WorkOrderQueueBloc
    extends Bloc<WorkOrderQueueEvent, WorkOrderQueueState> {
  @override
  // TODO: implement initialState
  WorkOrderQueueState get initialState => QueueLoading();

  @override
  Stream<WorkOrderQueueState> mapEventToState(
      WorkOrderQueueEvent event) async* {
    if (event is QueueLoadingEvent) {
      yield QueueLoading();
    } else if (event is QueueLoadedEvent) {
      yield QueueDataLoaded();
    } else if (event is QueueLoadFailure) {
      yield QueueDataFetchError(event.error);
    }
  }

  void fetchData() {
    add(QueueLoadingEvent());

    Future.delayed(Duration(seconds: 6), () {
      add(QueueLoadedEvent());
    });
  }
}
