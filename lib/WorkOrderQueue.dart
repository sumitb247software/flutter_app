import 'package:flutter/material.dart';
import 'package:flutter_app/WorkOrderQueueState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'LoadingDialog.dart';
import 'WorkOrderQueueBloc.dart';
import 'WorkTypeSelection.dart';

class WorkOrderQueue extends StatefulWidget {
  @override
  _WorkOrderQueueState createState() => _WorkOrderQueueState();
}

class _WorkOrderQueueState extends State<WorkOrderQueue> {
  WorkOrderQueueBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = WorkOrderQueueBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkOrderQueueBloc>(
      create: (context) => _bloc,
      child: WorkOrderQueueWidget(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}

class WorkOrderQueueWidget extends StatefulWidget {
  @override
  WorkOrderQueueWidgetState createState() => WorkOrderQueueWidgetState();
}

class WorkOrderQueueWidgetState extends State<WorkOrderQueueWidget> {
  WorkOrderQueueBloc _bloc;

  @override
  void initState() {
    super.initState();
    print('WorkOrderQueueWidgetState initState');
//    _bloc = BlocProvider.of<WorkOrderQueueBloc>(context);
    _bloc = WorkOrderQueueBloc();
    _bloc.fetchData();
  }

  @override
  Widget build(BuildContext context) {
//    return BlocListener<WorkOrderQueueBloc, WorkOrderQueueState>(
//      listener: (BuildContext _cntx, WorkOrderQueueState state) {
//        print('WorkOrderQueueWidgetState : state in listener : ${state}');
//        if (state is QueueLoading) {
//          LoadingDialog.showLoadingDialog(_cntx, null);
//        } else if (state is QueueDataLoaded) {
//          Navigator.of(_cntx).pop();
//        }
//      },
//      child: Scaffold(
//        body: BlocBuilder(
//          bloc: _bloc,
//          builder: (BuildContext _ctx, WorkOrderQueueState _state) {
//            print('WorkOrderQueueWidgetState : BlocBuilder');
//            return Center(
//              child: Text(' Work Order Status : ${_state.toString()}'),
//            );
//          },
//        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: () => _selectWorkType(context),
//          backgroundColor: Colors.blue,
//          child: Icon(
//            Icons.add,
//            color: Colors.white,
//          ),
//        ),
//      ),
//    );
    return Scaffold(
      body: Center(
        child: BlocConsumer<WorkOrderQueueBloc, WorkOrderQueueState>(
          listener: (BuildContext _cntx, WorkOrderQueueState state) {
            print('WorkOrderQueueWidgetState : state in listener : ${state}');
            if (state is QueueLoading) {
              LoadingDialog.showLoadingDialog(_cntx, null);
            } else if (state is QueueDataLoaded) {
              Navigator.of(_cntx).pop();
            }
          },
          builder: (BuildContext _ctx, WorkOrderQueueState _state) {
            print('WorkOrderQueueWidgetState : BlocBuilder : ${_state}');
            return Center(
              child: Text(' Work Order Status : ${_state.toString()}'),
            );
          },
          bloc: _bloc,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _selectWorkType(context),
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  _selectWorkType(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WorkTypeSelection()));
  }

  @override
  void dispose() {
    super.dispose();
    print('WorkOrderQueueWidgetState dispose');
    _bloc.close().then((onValue) {
      _bloc = null;
    });
  }
}
