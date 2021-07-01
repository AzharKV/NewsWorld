import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:world_news/controller/displayNews.dart';
import 'package:world_news/model/articles.dart';
import 'package:world_news/view/newsDetailPage.dart';

class NewsCardWidget extends StatelessWidget {
  NewsCardWidget({@required this.data});

  final Article data;
  final DisplayNews displayNews = Get.put(DisplayNews());

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          displayNews.addArticles(data);
          Get.to(() => NewsDetailPage());
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: SelectableText("${data.source.name}")),
                  Spacer(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SelectableText(
                            DateFormat('d/M/y').format(data.publishedAt)),
                        SelectableText(
                            DateFormat().add_jms().format(data.publishedAt)),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Image.network(
                    data.urlToImage != null
                        ? data.urlToImage
                        : 'https://4.bp.blogspot.com/-OCutvC4wPps/XfNnRz5PvhI/AAAAAAAAEfo/qJ8P1sqLWesMdOSiEoUH85s3hs_vn97HACLcBGAsYHQ/s1600/no-image-found-360x260.png',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                    width: double.infinity),
              ),
              SelectableText("${data.title}",
                  maxLines: 3,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.justify),
            ],
          ),
        ),
      ),
    );
  }
}
