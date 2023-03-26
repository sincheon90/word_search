import 'package:json_annotation/json_annotation.dart';
import 'part_of_speech_model.dart';

part 'meanings_model.g.dart';

@JsonSerializable()
class MeaningsModel {
  @JsonKey(name: 'partOfSpeech')
  final String partOfSpeech;

  @JsonKey(name: 'definitions')
  final List<PartOfSpeechModel> definitions;

  MeaningsModel({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory MeaningsModel.fromJson(Map<String, dynamic> json) =>
      _$MeaningsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningsModelToJson(this);
}
