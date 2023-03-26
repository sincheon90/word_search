import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:word_search/backup/word_model.dart';

class WordFirestoreService {
  final CollectionReference _wordCollectionReference =
  FirebaseFirestore.instance.collection('word');

  Future<void> addOrUpdateWord(Word word) async {
    try {
      await _wordCollectionReference.doc(word.id.toString()).set(word.toJson());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<Word>> getWords() {
    return _wordCollectionReference.orderBy('word').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Word.fromJson(json: doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Stream<List<Word>> getFavoriteWords() {
    return _wordCollectionReference
        .where('isFavorite', isEqualTo: true)
        .orderBy('word')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Word.fromJson(json: doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> deleteWord(Word word) async {
    try {
      await _wordCollectionReference.doc(word.id.toString()).delete();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
