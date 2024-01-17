import 'package:flutter/material.dart';
import 'package:news_app/components/categories_tile.dart';
import 'package:news_app/components/tiles_list_view_builder.dart';
import 'package:news_app/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: "assets/images/business.avif",
      categoryName: "business",
    ),
    CategoryModel(
      image: "assets/images/entertaiment.avif",
      categoryName: "entertainment",
    ),
    CategoryModel(
      image: "assets/images/health.avif",
      categoryName: "health",
    ),
    CategoryModel(
      image: "assets/images/technology.jpeg",
      categoryName: "technology",
    ),
    CategoryModel(
      image: "assets/images/science.avif",
      categoryName: "science",
    ),
    CategoryModel(
      image: "assets/images/sports.avif",
      categoryName: "sports",
    ),
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              // Categories List
              SizedBox(
                height: 120.0,
                child: CategoriesTile(categories: categories),
              ),
              const SizedBox(
                height: 32.0,
              ),
              const TilesListViewBuilder(),

              // news List Tiles
            ],
          ),
        ),
      ),
    );
  }
}
