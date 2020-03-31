import 'package:black_cumin/providers/articles.dart';
import './article_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticlesList extends StatelessWidget {
  final int journalId;
  ArticlesList({this.journalId});
  @override
  Widget build(BuildContext context) {
    final articlesData = Provider.of<Articles>(context);
    return RefreshIndicator(
      onRefresh: ()=> articlesData.fetchAndSetArticles(journalId),
          child: journalId != null ?
          ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: articlesData.articles.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: articlesData.articles[i],
          child: ArticleItem(),
        ),
      ): Center(child:Text("Üzgünüm bu sayıda yazı bulunmamaktadır..."))
    );
  }
}