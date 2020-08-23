import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Ext {
  static handleError(String toastMessage, String errorMessage) {
    Fluttertoast.showToast(
        msg: toastMessage,
        backgroundColor: Colors.white,
        textColor: Colors.black);
    log(errorMessage);
  }

  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new SizedBox(width: 24.0,),
                new Text("Loading..."),
              ],
            ),
          ),
        );
      },
    );
  }

  static dismissLoading(BuildContext context) => Navigator.pop(context);
}
