import 'package:flutter/material.dart';
import 'package:news_app/components/news_tile_style.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category});

  final String category ;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  var future ;

  @override
  void initState() {
    super.initState();
    future = NewsData().getGeneralNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return SingleChildScrollView(child: NewsTileStyle(articles: snapshot.data!));
          }
          else if (snapshot.hasError){
            return const Center(child: Text("there was an error"));
          }
          else {
            return const Center(child:  CircularProgressIndicator());
          }

      },),
    );
  }
}
