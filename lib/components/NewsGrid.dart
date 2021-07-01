import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:world_news/controller/fetchNews.dart';
import 'package:world_news/model/articles.dart';
import 'package:world_news/customResponsive.dart';

import '../widgets/newsCardWidget.dart';

class NewsDisplay extends StatelessWidget {
  final FetchNewsController fetchNewsController =
      Get.put(FetchNewsController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (fetchNewsController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return GridView.builder(
          itemCount: fetchNewsController.newsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > 1440
                  ? 4
                  : CustomResponsive.isDesktop(context)
                      ? 3
                      : CustomResponsive.isTablet(context)
                          ? 2
                          : 1),
          itemBuilder: (BuildContext context, int index) {
            Article data = fetchNewsController.newsList[index];
            return NewsCardWidget(data: data);
          },
        );
    });
  }
}
