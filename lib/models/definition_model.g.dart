// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefinitionModel _$DefinitionModelFromJson(Map<String, dynamic> json) =>
    DefinitionModel(
      definition: json['definition'] as String,
      example: json['example'] as String?,
    );

Map<String, dynamic> _$DefinitionModelToJson(DefinitionModel instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
    };
