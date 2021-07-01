import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_news/controller/fetchNews.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    @required this.fetchNewsController,
    @required this.category,
    @required this.country,
    this.toHomePage,
  }) : super(key: key);

  final FetchNewsController fetchNewsController;
  final category;
  final country;
  final bool toHomePage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 1.0, color: Colors.black54),
        ListTile(
          title: Text(category.toString().capitalizeFirst),
          onTap: () {
            fetchNewsController
                .fetchNews(fetchNewsController.categoryApi(category, country));
            if (toHomePage == true && toHomePage != null) Get.back();
          },
        ),
      ],
    );
  }
}
