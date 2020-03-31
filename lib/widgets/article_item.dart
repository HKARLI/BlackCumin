import 'package:black_cumin/providers/article.dart';
import 'package:black_cumin/screens/article_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final article = Provider.of<Article>(context, listen: false);
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(ArticleDetailScreen.routeName, arguments: article.id);
      },
          child: Padding(
            
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: article.imageUrl != null ? BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                     image: DecorationImage(
                        image: NetworkImage(article.imageUrl), fit: BoxFit.cover)
                  ):
                  BoxDecoration( color: Colors.blue)
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              article.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                             Text(
                              article.subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              article.author,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(
                              '${article.publishDate} · ${article.readDuration} ★',
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
