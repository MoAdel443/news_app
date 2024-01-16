import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsData {
  final Dio dio = Dio();

  Future<List<ArticleModel>> getGeneralNews() async {
    try {
      Response response = await dio.get(
          'https://newsdata.io/api/1/news?apikey=pub_36474b428872e59766c3fae2e4e780a45a6e2&country=eg');

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['results'];

      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
            image: article['image_url'],
            title: article['title'],
            subtitle: article['content']
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    }
    catch (e) {
      return [] ;
    }
  }
}
