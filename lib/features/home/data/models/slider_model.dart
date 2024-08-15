import 'package:json_annotation/json_annotation.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel {
  String? body;
  @JsonKey(name: 'body_en')
  String? bodyEn;
  String? id;
  String? image;

  SliderModel({
    this.body,
    this.bodyEn,
    this.id,
    this.image,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => _$SliderModelFromJson(json);
  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}