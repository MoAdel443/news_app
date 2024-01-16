import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articles});

  final ArticleModel articles ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.network(
            articles.image ?? "https://picsum.photos/200",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),

        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          articles.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          articles.subtitle ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}