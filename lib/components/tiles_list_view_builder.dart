import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile_style.dart';
import 'package:news_app/services/news_data.dart';

class TilesListViewBuilder extends StatelessWidget {
  const TilesListViewBuilder({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NewsData().getGeneralNews(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Center(child: CircularProgressIndicator())
            : NewsTileStyle(articles: snapshot.data ?? []);
      },
    );
  }
}
