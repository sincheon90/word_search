import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:word_search/models/word_model.dart';

class WordProvider extends ChangeNotifier {
  String searchWord = '';
  Map<String, List<WordModel>> cache = {};

  void search({required term}) async {
    searchWord = term;

    if (cache.containsKey(searchWord)) {
      notifyListeners();
      return;
    }

    final resp = await Dio()
        .get('https://api.dictionaryapi.dev/api/v2/entries/en_US/$term');

    final List<WordModel> words = (resp.data as List<dynamic>)
        .map((e) => WordModel.fromJson(e as Map<String, dynamic>))
        .toList();
    print(words);

    cache.update(term, (value) => words, ifAbsent: () => words);

    notifyListeners();
  }


  @override
  void dispose() {
    clearCache();
    super.dispose();
  }

  void clearCache() {
    cache.clear();
  }
}
