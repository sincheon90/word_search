// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordModel _$WordModelFromJson(Map<String, dynamic> json) => WordModel(
      word: json['word'] as String,
      meanings: (json['meanings'] as List<dynamic>)
          .map((e) => MeaningsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WordModelToJson(WordModel instance) => <String, dynamic>{
      'word': instance.word,
      'meanings': instance.meanings,
    };
