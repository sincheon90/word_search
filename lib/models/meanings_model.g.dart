// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meanings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeaningsModel _$MeaningsModelFromJson(Map<String, dynamic> json) =>
    MeaningsModel(
      partOfSpeech: json['partOfSpeech'] as String,
      definitions: (json['definitions'] as List<dynamic>)
          .map((e) => PartOfSpeechModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MeaningsModelToJson(MeaningsModel instance) =>
    <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
    };
