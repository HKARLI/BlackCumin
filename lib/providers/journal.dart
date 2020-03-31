import 'package:flutter/material.dart';
class Journal with ChangeNotifier  {
  final int id;
  final String date;
  final String imageUrl;

  Journal({this.id, this.date, this.imageUrl});
}