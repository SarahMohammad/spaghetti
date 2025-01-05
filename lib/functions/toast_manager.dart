import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/commonWidgets/toast_widget.dart';

class ToastManager {

  static showToast({required ToastState state , required String title , required BuildContext context }) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: _getToastType(state , title),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      fadeDuration: const Duration(milliseconds: 500),
    );
  }

  static _getToastType(ToastState state , String title){
    switch (state) {
      case ToastState.positive:
        return ToastWidget.positive(title: title);
      case ToastState.negative:
        return ToastWidget.negative(title: title);
      case ToastState.neutral:
        return ToastWidget.neutral(title: title);
    }
  }
}

enum ToastState { positive, negative, neutral }
