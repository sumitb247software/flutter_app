import 'package:flutter_bloc/flutter_bloc.dart';

import 'WorkTypeEvent.dart';
import 'WorkTypeState.dart';

class WorkTypeBloc extends Bloc<WorkTypeEvent, WorkTypeState> {
  @override
  WorkTypeState get initialState => WorkTypeLoading();

  @override
  Stream<WorkTypeState> mapEventToState(WorkTypeEvent event) async* {
    if (event is WorkTypeLoadingEvent) {
      yield WorkTypeLoading();
    } else if (event is WorkTypeLoadedEvent) {
      yield WorkTypeDataLoaded();
    } else if (event is WorkTypeLoadFailure) {
      yield WorkTypeDataFetchError(event.error);
    }
  }

  void fetchData() {
    add(WorkTypeLoadingEvent());

    Future.delayed(Duration(seconds: 2), () {
      add(WorkTypeLoadedEvent());
    });
  }
}
