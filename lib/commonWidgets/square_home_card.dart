import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled3/UIHelpers/icons.dart';
import 'package:untitled3/uiHelpers/app_spacing.dart';
import 'package:untitled3/uiHelpers/font_text_style.dart';
import 'package:untitled3/utils/constant.dart';

class SquareHomeCard extends StatelessWidget {
  String title;
  String subTitle;
  Color bgColor;
  Color bgCountColor;
  String count;
  String cardIcon;

   SquareHomeCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.bgColor,
    required this.bgCountColor,
    required this.count,
    required this.cardIcon,

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 160.getHeight(),
      width: 170.getWidth(),
      decoration: ShapeDecoration(
        color: bgColor,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x3D000000),
            blurRadius: 16,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: AppSpacing.m.getWidth(),
          vertical: AppSpacing.m.getHeight()
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circle with the number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: bgCountColor,
                  child: Text(
                    count,
                    style: FontTextStyle.labelX.copyWith(color: Colors.white),
                  ),
                ),
                SvgPicture.asset(cardIcon ,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                width: 24.getWidth(),height: 24.getHeight(),)
              ],
            ),
            SizedBox(height: AppSpacing.l.getHeight()),
            // Title and subtitle
            Text(
              title,
              style: FontTextStyle.labelX.copyWith(color: Colors.white),
            ),
             SizedBox(height: AppSpacing.s.getHeight()),
            Text(
              subTitle,
              style: FontTextStyle.paragraphMedium.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
