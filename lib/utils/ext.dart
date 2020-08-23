import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Ext {
  static handleError(String toastMessage, String errorMessage) {
    Fluttertoast.showToast(msg: toastMessage, backgroundColor: Colors.white, textColor: Colors.black);
    log(errorMessage);
  }
}
