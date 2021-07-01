import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:world_news/controller/fetchNews.dart';
import 'package:world_news/widgets/drawerListTileWidget.dart';

class DrawerMenu extends StatelessWidget {
  final bool toHomePage;
  final FetchNewsController fetchNewsController =
      Get.put(FetchNewsController());

  final TextEditingController searchQuery = TextEditingController();

  DrawerMenu({Key key, this.toHomePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tv),
                SelectableText('Indian News'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchQuery,
              onSubmitted: (value) => fetchNewsController
                  .fetchNews(fetchNewsController.searchApi((value))),
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => fetchNewsController.fetchNews(
                        fetchNewsController.searchApi((searchQuery.text))),
                  ),
                ),
              ),
            ),
          ),
          DrawerListTile(
              fetchNewsController: fetchNewsController,
              category: 'general',
              country: 'in',
              toHomePage: toHomePage),
          DrawerListTile(
              fetchNewsController: fetchNewsController,
              category: 'health',
              country: 'in',
              toHomePage: toHomePage),
          DrawerListTile(
              fetchNewsController: fetchNewsController,
              category: 'entertainment',
              country: 'in',
              toHomePage: toHomePage),
          DrawerListTile(
              fetchNewsController: fetchNewsController,
              category: 'science',
              country: 'in',
              toHomePage: toHomePage),
          DrawerListTile(
              fetchNewsController: fetchNewsController,
              category: 'sports',
              country: 'in',
              toHomePage: toHomePage),
          DrawerListTile(
              fetchNewsController: fetchNewsController,
              category: 'technology',
              country: 'in',
              toHomePage: toHomePage),
          DrawerListTile(
              fetchNewsController: fetchNewsController,
              category: 'business',
              country: 'in',
              toHomePage: toHomePage),
        ],
      ),
    );
  }
}
