import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String msg,
  required ToastState state,
})
{
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastState{success, error, warning}

Color chooseColor(ToastState state)
{
  Color color;
  switch(state){
    case ToastState.success:
      color = Colors.green;
      break;

    case ToastState.error:
      color = Colors.red;
      break;

    case ToastState.warning:
      color = Colors.amber;
      break;  
  }
  return color;
}
