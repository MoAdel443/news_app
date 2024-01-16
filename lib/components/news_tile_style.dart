import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile.dart';
import 'package:news_app/models/article_model.dart';

class NewsTileStyle extends StatelessWidget {
  const NewsTileStyle({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15.0,
        );
      },
      itemBuilder: (context, index) {
        return NewsTile(
          articles: articles[index],
        );
      },
      itemCount: articles.length,
    );
  }
}