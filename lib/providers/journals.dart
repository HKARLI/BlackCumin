import 'dart:convert';

import 'package:black_cumin/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './journal.dart';

class Journals with ChangeNotifier {
  List<Journal> _journals = [];

  List<Journal> get journals {
    return [..._journals];
  }

  Future<void> fetchAndSetJournals() async {
    final url = FIREBASE_URL + 'journals/journals.json';
    final List<Journal> _loadedJournals = [];
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List<dynamic>;
      if (extractedData == null) {
        return;
      }
      for (var i = 0; i < extractedData.length; i++) {
        _loadedJournals.add(Journal(
            id: i,
            date: extractedData[i]['date'],
            imageUrl: extractedData[i]['image_url']));
      }
      _journals = _loadedJournals;
      notifyListeners();
    } catch (error) {
      print("error:$error");
    }
  }
}
