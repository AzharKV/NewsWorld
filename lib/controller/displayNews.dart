import 'package:get/get.dart';
import 'package:world_news/model/articles.dart';

class DisplayNews extends GetxController {
  Article article;

  void addArticles(Article newArticle) => article = newArticle;
}
