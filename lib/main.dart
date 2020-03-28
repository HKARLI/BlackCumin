import 'package:black_cumin/screens/article_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/articles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Articles())],
      child: MaterialApp(
        title: 'Material App',
        home: ArticleOverviewScreen(),
      ),
    );
  }
}
