import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../customResponsive.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget(this.appBar);

  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SelectableText("Indian News"),
      centerTitle: true,
      leading: CustomResponsive.isMobile(context) ? null : Icon(Icons.tv),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              SelectableText(DateFormat('d/M/y').format(DateTime.now()))
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
