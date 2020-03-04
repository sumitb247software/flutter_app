import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'WorkTypeBloc.dart';
import 'WorkTypeState.dart';

class WorkTypeSelection extends StatefulWidget {
  @override
  _WorkTypeSelectionState createState() => _WorkTypeSelectionState();
}

class _WorkTypeSelectionState extends State<WorkTypeSelection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkTypeBloc>(
      create: (context) => WorkTypeBloc(),
      child: WorkTypeWidget(),
    );
  }
}

class WorkTypeWidget extends StatefulWidget {
  @override
  _WorkTypeWidgetState createState() => _WorkTypeWidgetState();
}

class _WorkTypeWidgetState extends State<WorkTypeWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WorkTypeBloc>(context).fetchData();
  }

  WorkTypeBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<WorkTypeBloc>(context);
//    return BlocListener<WorkTypeBloc, WorkTypeState>(
//      listener: (BuildContext _cntx, WorkTypeState state) {
//        print('_WorkTypeWidgetState : state in listener : ${state}');
//        if (state is WorkTypeLoading) {
//          LoadingDialog.showLoadingDialog(_cntx, 'Loading Work Types');
//        } else if (state is WorkTypeDataLoaded) {
//          Navigator.of(_cntx).pop();
//        }
//      },
//      child: Scaffold(
//        body: BlocBuilder(
//          bloc: BlocProvider.of<WorkTypeBloc>(context),
//          builder: (BuildContext _ctx, WorkTypeState _state) {
//            print('_WorkTypeWidgetState : BlocBuilder');
//            return Center(
//              child: Text(' Work Order Status : ${_state.toString()}'),
//            );
//          },
//        ),
//      ),
//    );

    return Scaffold(
      body: Center(
        child: BlocConsumer<WorkTypeBloc, WorkTypeState>(
          listener: (context, WorkTypeState state) {},
          builder: (BuildContext _cntx, WorkTypeState state) {
            if (state is WorkTypeLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WorkTypeDataLoaded) {
              return Center(
                child: Text(' Work Order Status : ${state.toString()}'),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }
}
