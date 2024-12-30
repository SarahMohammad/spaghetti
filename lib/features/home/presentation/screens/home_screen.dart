import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:untitled3/utils/constant.dart';

import '../../../../UIHelpers/images.dart';
import '../../../../commonWidgets/search_box.dart';
import '../../../../core/app_states/app_state_handler_widget.dart';
import '../../../../uiHelpers/font_text_style.dart';
import '../../../services/widgets/service_card_widget.dart';
import '../../../services/widgets/service_category_widget.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GetBuilder<HomeController>(
        //NOTE => AppStateHandlerWidget must be placed inside GetBuilder to get updated
        builder: (homeController) =>
            AppStateHandlerWidget(
              state: homeController.loadingState,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    Images.headerImg,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  // Adjust the radius as needed
                                  bottomRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 130.getHeight()),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 25.getWidth(),
                                      right: 25.getWidth(),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        SizedBox(
                                          // width: 188.getWidth(),
                                          // height: 71.getHeight(),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(text: "hi,"),
                                                TextSpan(
                                                  text: "Abdelrhman!",
                                                ),
                                              ],
                                            ),
                                            style: TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.notifications,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          width: 40.getWidth(),
                                          height: 40.getHeight(),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                Images.avatar,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SearchBox(
                                      onChanged: null,
                                      prefixIconExist: true,
                                      suffixColor: Colors.white,
                                      backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                      title: "Search",
                                      prefixIconColor: Colors.white,
                                      titleStyle: FontTextStyle.paragraphLarge
                                          .copyWith(color: Colors.white),
                                      borderColor: Colors.transparent,
                                    ),
                                  ),
                                  SizedBox(height: 60.getHeight()),
                                ],
                              ),
                            ),
                            SizedBox(height: Get.height + 50),
                          ],
                        ),
                        Positioned(
                          top: 250.getHeight(),
                          left: 16.getWidth(),
                          right: 16.getWidth(),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 150, // Adjust width as needed
                                    height: 135, // Adjust height as needed
                                    decoration: BoxDecoration(
                                      color: Colors.brown[900],
                                      // Dark background color
                                      borderRadius: BorderRadius.circular(
                                          16), // Rounded corners
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              // Circle with the number
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.black,
                                                child: Text(
                                                  "9",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              // Title and subtitle
                                              Text(
                                                "title",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "subtitle",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Clock icon
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.access_time,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 150, // Adjust width as needed
                                    height: 135, // Adjust height as needed
                                    decoration: BoxDecoration(
                                      color: Colors.brown[300],
                                      // Dark background color
                                      borderRadius: BorderRadius.circular(
                                          16), // Rounded corners
                                    ),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              // Circle with the number
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor: Colors.black,
                                                child: Text(
                                                  "9",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              // Title and subtitle
                                              Text(
                                                "title",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "subtitle",
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Clock icon
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.access_time,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("favorites"),
                                  Obx(
                                        () =>
                                        ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: homeController.visibleItems
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 3.0),
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8.0),
                                                ),
                                                child: ListTile(
                                                  title: Text(
                                                      homeController
                                                          .visibleItems[index]),
                                                  trailing: const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                color: index % 2 == 0 ? Colors
                                                    .green[200] : Colors
                                                    .yellow[200], // Alternating colors

                                              ),
                                            );
                                          },
                                        ),
                                  ),
                                  Obx(
                                        () =>
                                        TextButton.icon(
                                          onPressed: homeController
                                              .toggleExpansion,
                                          icon: Icon(
                                            homeController.isExpanded.value
                                                ? Icons.expand_less
                                                : Icons.expand_more,
                                          ),
                                          label: Text(
                                            homeController.isExpanded.value
                                                ? "Show less"
                                                : "Show more",
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("services"),
                                  ServiceCategoryWidget(
                                      title: 'human capital',
                                      onTap: () {
                                      }),
                                  Expanded(
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: List.generate(
                                            (homeController.items.length / 3).ceil(),
                                            // Number of vertical columns
                                                (columnIndex) {
                                              int startIndex = columnIndex * 3;
                                              int endIndex = (columnIndex + 1) * 3;

                                              return Column(
                                                children: homeController.items
                                                    .sublist(startIndex,
                                                    endIndex > homeController.items.length ? homeController.items
                                                        .length : endIndex)
                                                    .map((item) =>
                                                    ServiceCardWidget(
                                                      title: "services Controller",
                                                      onPress: () {
                                                      },
                                                    )
                                                )
                                                    .toList(),
                                              );
                                            },
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: List.generate(
                                      (homeController.items.length / 3).ceil(),
                                      // Number of vertical columns
                                          (columnIndex) {
                                        int startIndex = columnIndex * 3;
                                        int endIndex = (columnIndex + 1) * 3;

                                        return Column(
                                          children: homeController.items
                                              .sublist(startIndex,
                                              endIndex > homeController.items.length ? homeController.items
                                                  .length : endIndex)
                                              .map((item) =>
                                              Container(
                                                margin: EdgeInsets.all(8.0),
                                                padding: EdgeInsets.all(16.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.blueAccent,
                                                  borderRadius: BorderRadius
                                                      .circular(8.0),
                                                ),
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                              .toList(),
                                        );
                                      },
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
