import 'package:flutter/material.dart';
import 'package:world_news/components/detailPage.dart';
import 'package:world_news/components/drawer.dart';
import 'package:world_news/widgets/appBarWidget.dart';

import '../customResponsive.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(AppBar()),
      body: SafeArea(
        child: Row(
          children: [
            if (!CustomResponsive.isMobile(context))
              Expanded(child: DrawerMenu(toHomePage: true)),
            Expanded(flex: 5, child: DetailPage()),
          ],
        ),
      ),
    );
  }
}


