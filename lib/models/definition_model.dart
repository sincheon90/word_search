import 'package:json_annotation/json_annotation.dart';

part 'definition_model.g.dart';

@JsonSerializable()
class DefinitionModel {
  @JsonKey(name: 'definition')
  final String definition;

  @JsonKey(name: 'example')
  final String? example;

  DefinitionModel({
    required this.definition,
    this.example,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      _$DefinitionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DefinitionModelToJson(this);
}