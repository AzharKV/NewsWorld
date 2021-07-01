import 'package:get/get.dart';
import 'package:world_news/model/articles.dart';
import 'package:world_news/model/news.dart';
import 'package:world_news/services/newApiCalling.dart';

class FetchNewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = <Article>[].obs;

  @override
  void onInit() {
    fetchNews(categoryApi('general', 'in'));
    super.onInit();
  }

  categoryApi(category, country) =>
      "https://newsapi.org/v2/top-headlines?country=$country&category=$category"
      "&pageSize=51&apiKey=e40b1d550d9247959633cb7058645e9f";

  searchApi(searchQuery) =>
      "https://newsapi.org/v2/top-headlines?q=$searchQuery&pageSize=51&apiKey=e40b1d550d9247959633cb7058645e9f";

  void fetchNews(newApi) async {
    try {
      isLoading(true);
      News news = await NewsApiCalling.fetchNews(newApi);

      if (news.status == 'ok') newsList.value = news.articles;
    } finally {
      isLoading(false);
    }
  }
}
