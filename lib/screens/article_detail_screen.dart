import 'package:black_cumin/providers/articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const routeName = '/article-detail';
  @override
  Widget build(BuildContext context) {
    final articleId = ModalRoute.of(context).settings.arguments as String;
    final article =
        Provider.of<Articles>(context, listen: false).findById(articleId);
    final mediaQuery = MediaQuery.of(context);

    final availableWidth = mediaQuery.size.width - 110;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                article.imageUrl,
                fit: BoxFit.cover,
              ),
              title: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: availableWidth,
                ),
                child: Text(article.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis),
              ),
              centerTitle: true,
            )),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Container(
                child: Html(
              customTextStyle: (_, TextStyle baseStyle) {
                return baseStyle.merge(TextStyle(height: 2, fontSize: 14));
              },
              data: article.content,
            )),
          ),
        )
      ],
    ));
  }
}
