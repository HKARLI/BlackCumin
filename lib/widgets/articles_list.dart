import 'package:black_cumin/providers/articles.dart';
import 'package:black_cumin/screens/article_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articlesData = Provider.of<Articles>(context).articles;
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: articlesData.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: articlesData[i],
        child: ArticleItem(),
      ),
    );
  }
}