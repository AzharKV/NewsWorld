import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_news/components/drawer.dart';
import 'package:world_news/components/NewsGrid.dart';
import 'package:world_news/customResponsive.dart';
import 'package:world_news/widgets/appBarWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(AppBar()),
      drawer: DrawerMenu(),
      body: SafeArea(
        child: Row(
          children: [
            if (!CustomResponsive.isMobile(context)) Expanded(child: DrawerMenu()),
            Expanded(flex: 5, child: NewsDisplay()),
          ],
        ),
      ),
    );
  }
}
