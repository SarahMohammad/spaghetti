import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled3/commonWidgets/search_box.dart';
import 'package:untitled3/utils/constant.dart';

import '../UIHelpers/icons.dart';
import '../uiHelpers/app_colors.dart';
import '../uiHelpers/font_text_style.dart';
import '../utils/translation_keys.dart';

class SliverAppBarContainer extends StatelessWidget {
  final void Function()? onSearchIconClick;
  final void Function(String)? onSearchChanged;
  final bool isSearching;
  final String title;
  final String? prefixIcon;

  const SliverAppBarContainer({super.key,
    this.onSearchIconClick,
    this.onSearchChanged,
    required this.isSearching,
    required this.title,this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 25.getWidth(),
          top: 60.getHeight(),
          right: 28.getHeight(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: FontTextStyle.headingX
                      .copyWith(color: Colors.white),
                ),
                GestureDetector(
                  onTap: onSearchIconClick,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(11.getHeight()),
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                      child: SvgPicture.asset(
                        prefixIcon ?? AllIcons.searchIcon,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: isSearching
                    ? 20.getHeight()
                    : 10),
            // Show search box only when in search mode and app bar is expanded
            if (isSearching)
              SearchBox(
                onChanged: onSearchChanged ?? (value) {},
                prefixIconExist: true,
                suffixColor: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.2),
                title: search.tr,
                prefixIconColor: Colors.white,
                titleStyle: FontTextStyle.paragraphLarge
                    .copyWith(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}