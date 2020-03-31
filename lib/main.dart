import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/journals.dart';
import './screens/article_detail_screen.dart';
import './screens/article_overview_screen.dart';
import './screens/journal_overview_screen.dart';

import './providers/articles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Articles()),
        ChangeNotifierProvider.value(value: Journals())
      ],
      child: MaterialApp(
        title: 'Black Cumin',
        home: JournalOverviewScreen(),
        theme: ThemeData(
            accentColor: Colors.lightBlueAccent,
            appBarTheme: AppBarTheme(
                color: Colors.white38,
                textTheme: TextTheme(
                  title: TextStyle(color: Colors.black),
                ))),
        routes: {
          ArticleOverviewScreen.routeName: (ctx) => ArticleOverviewScreen(),
          ArticleDetailScreen.routeName: (ctx) => ArticleDetailScreen(),
        },
      ),
    );
  }
}
