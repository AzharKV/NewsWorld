import 'package:http/http.dart' as http;
import 'package:world_news/model/news.dart';

class NewsApiCalling {
  static var client = http.Client();

  static fetchNews(category) async {
    var response = await client.get(Uri.parse(category));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return newsFromJson(jsonString);
    } else {
      print("SomeThing Wrong On fetchWorldNews $category");
    }
  }
}
