
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:untitled3/uiHelpers/app_colors.dart';
import 'package:untitled3/utils/translation_keys.dart';

import '../uiHelpers/font_text_style.dart';

class CountDownTimerWidget extends StatelessWidget {
  final int seconds;
  bool isValid;
  final void Function()? onEnd;
  CountDownTimerWidget(
      {Key? key, required this.seconds, this.onEnd, required this.isValid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isValid
            ? Text(
                "${resendCode.tr} ",
                style: FontTextStyle.labelMedium,
              )
            : Text(
                verify.tr,
                style: FontTextStyle.labelLarge.copyWith(
                  color: Colors.red,
                ),
              ),
        CountdownTimer(
          endTime: DateTime.now().millisecondsSinceEpoch +
              Duration(
                seconds: seconds,
              ).inMilliseconds,
          textStyle: FontTextStyle.labelMedium,
          widgetBuilder: (_, time) {
            if (time == null) {
              return Text(
                '00:00',
                style: FontTextStyle.paragraphMedium
                    .copyWith(color: AppColors.neutral900),
              );
            }
            return Text(
              time.min == null
                  ? '00:${time.sec.toString().padLeft(2, '0')}'
                  : '${time.min.toString().padLeft(2, '0')}:${time.sec.toString().padLeft(2, '0')}',
              style: FontTextStyle.labelLarge
                  .copyWith(color: AppColors.neutral700),
            );
          },
          endWidget: Text(
            "00",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: FontTextStyle.labelSmall
                .copyWith(color: AppColors.neutral200),
          ),
          onEnd: onEnd,
        ),
      ],
    );
  }
}
