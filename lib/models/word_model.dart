import 'package:json_annotation/json_annotation.dart';
import 'meanings_model.dart';

part 'word_model.g.dart';

@JsonSerializable()
class WordModel {
  @JsonKey(name: 'word')
  final String word;

  @JsonKey(name: 'meanings')
  final List<MeaningsModel> meanings;

  WordModel({
    required this.word,
    required this.meanings,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);

  Map<String, dynamic> toJson() => _$WordModelToJson(this);
}
