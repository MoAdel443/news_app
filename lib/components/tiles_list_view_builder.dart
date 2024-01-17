import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile_style.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_data.dart';

class TilesListViewBuilder extends StatefulWidget {
  const TilesListViewBuilder({
    super.key,
  });

  @override
  State<TilesListViewBuilder> createState() => _TilesListViewBuilderState();
}

class _TilesListViewBuilderState extends State<TilesListViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsData().getGeneralNews(category: 'top');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsTileStyle(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const Text(
            'oops there was an error',
            style: TextStyle(color: Colors.black),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
