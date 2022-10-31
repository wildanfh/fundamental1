import 'package:flutter/material.dart';
import 'package:fundamental/news-app/common/navigation.dart';
import 'package:fundamental/news-app/common/styles.dart';
import 'package:fundamental/news-app/data/model/article.dart';
import 'package:fundamental/news-app/ui/article_detail_page.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author ?? ""),
        onTap: () => Navigation.intentWithData(ArticleDetailPage.routeName, article),
      ),
    );
  }
}
