import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:untitled3/utils/constant.dart';

class LoadingStateWidget extends StatelessWidget{
  const LoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
        child: Align(
         alignment: Alignment.center,
          child: Container(
            color: Colors.transparent,
            width: 30.getWidth(),
            height: 30.getHeight(),
            child: const LoadingIndicator(
                indicatorType: Indicator.circleStrokeSpin, /// Required, The loading type of the widget
                colors: [Colors.blue,Colors.blueAccent],       /// Optional, The color collections
                strokeWidth: 2,                     /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Colors.transparent,      /// Optional, Background of the widget
                pathBackgroundColor: Colors.transparent   /// Optional, the stroke backgroundColor
            ),
          ),
        ),
      ),
    );
  }

}