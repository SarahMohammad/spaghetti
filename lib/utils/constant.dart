import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SettingSize on num {
  double getHeight() {
    return ScreenUtil().setHeight(this);
  }

  double getWidth() {
    return ScreenUtil().setWidth(this);
  }

  double getFontSize() {
    return ScreenUtil().setSp(this);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeAll() {
    return toUpperCase();
  }

  
  String trimTo(int trimmer) {
    if (length > trimmer) {
      return "${substring(0, trimmer)}..."; //substring(0, trimmer) + '...';
    }
    return this;
  }


  String lastChars(int n) => substring(length - n);
}
