import 'package:flutter/material.dart';

class Article with ChangeNotifier {
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final String author;
  final String publishDate;
  final String imageUrl;
  final String readDuration;
  final String category;

  Article({
      @required this.id,
      @required this.title,
      @required this.subtitle,
      @required this.content,
      @required this.author,
      @required this.publishDate,
      @required this.imageUrl,
      @required this.readDuration,
      @required this.category,
      });


}
