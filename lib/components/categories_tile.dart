import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_screen.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 12.0,
        );
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return CategoryScreen(category: categories[index].categoryName,);
                },
              ),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 180.0,
                height: 100.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                child: Image.asset(
                  categories[index].image,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                categories[index].categoryName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
            ],
          ),
        );
      },
      itemCount: categories.length,
    );
  }
}
