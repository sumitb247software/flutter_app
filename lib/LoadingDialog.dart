import 'package:flutter/material.dart';

///Created By :- Sumit Rohidas Bhondave.

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String message) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            backgroundColor: Colors.white,
            children: <Widget>[
              Center(
                heightFactor: 1.5,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: CircularProgressIndicator(),
                    ),
                    Expanded(
                      child: Text(
                        message != null ? message : "Please Wait....",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
