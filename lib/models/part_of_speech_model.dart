import 'package:json_annotation/json_annotation.dart';
import 'definition_model.dart';

part 'part_of_speech_model.g.dart';

@JsonSerializable()
class PartOfSpeechModel {
  @JsonKey(name: 'definition')
  final String definition;

  @JsonKey(name: 'example')
  final String? example;

  PartOfSpeechModel({
    required this.definition,
    this.example,
  });

  factory PartOfSpeechModel.fromJson(Map<String, dynamic> json) =>
      _$PartOfSpeechModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartOfSpeechModelToJson(this);
}
