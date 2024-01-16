import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile_style.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_data.dart';

class TilesListViewBuilder extends StatefulWidget {
  const TilesListViewBuilder({
    super.key,
  });

  @override
  State<TilesListViewBuilder> createState() => _TilesListViewState();
}

class _TilesListViewState extends State<TilesListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    getGeneralNews();
    super.initState();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsData().getGeneralNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Padding(
            padding: EdgeInsets.only(top: 250.0),
            child: Center(
                child: CircularProgressIndicator(
              strokeWidth: 6.0,
              color: Colors.black87,
            )),
          )
        : NewsTileStyle(articles: articles);
  }
}


