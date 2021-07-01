import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:world_news/controller/displayNews.dart';

class DetailPage extends StatelessWidget {
  final DisplayNews displayNews = Get.put(DisplayNews());
  @override
  Widget build(BuildContext context) {
    return displayNews.article == null
        ? Center(child: Text("Failed To Load News"))
        : ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child:
                          SelectableText("${displayNews.article.source.name}")),
                  Spacer(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SelectableText(DateFormat('d/M/y')
                            .format(displayNews.article.publishedAt)),
                        SelectableText(DateFormat()
                            .add_jms()
                            .format(displayNews.article.publishedAt)),
                      ],
                    ),
                  ),
                ],
              ),
              Image.network(
                  displayNews.article.urlToImage != null
                      ? displayNews.article.urlToImage
                      : 'https://4.bp.blogspot.com/-OCutvC4wPps/XfNnRz5PvhI/AAAAAAAAEfo/qJ8P1sqLWesMdOSiEoUH85s3hs_vn97HACLcBGAsYHQ/s1600/no-image-found-360x260.png',
                  fit: BoxFit.cover),
              SelectableText(displayNews.article.author),
              SelectableText("${displayNews.article.title}",
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.justify),
              SelectableText(displayNews.article.content),
              InkWell(
                  onTap: () async => await launch(displayNews.article.url),
                  child: Text("ReadMore...",style: TextStyle(color: Colors.blue)))
            ],
          );
  }
}
