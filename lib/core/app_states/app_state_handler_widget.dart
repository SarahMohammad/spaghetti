import 'package:flutter/material.dart';
import '../app_enums.dart';
import 'no_internet_widget.dart';
import 'package:untitled3/utils/constant.dart';

class AppStateHandlerWidget extends StatelessWidget {
  final Function()? onRetry;
  final Widget child;
  final AppState state;
  final bool isShimmer;
  final Widget? onEmpty;
  final bool? isEmpty;
  final Widget? onWaiting;
  final Function()? onTryAgain;
  final bool emptyWhileLoading;

  const AppStateHandlerWidget(
      {Key? key,
      required this.child,
      required this.state,
      this.onRetry,
      this.isShimmer = false,
      this.onEmpty,
      this.onTryAgain,
      this.isEmpty = false,
      this.onWaiting,
      this.emptyWhileLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (state == AppState.loading)
          Center(
            child: Container(
              color: Colors.white.withOpacity(0.6),
              child: Center(
                child: Container(child: Text("loading.."),
                    height: 130.getHeight()),
              ),
            ),
          )
        else if (state == AppState.noInternet)
          const NoInternetWidget()
      ],
    );
  }
}
