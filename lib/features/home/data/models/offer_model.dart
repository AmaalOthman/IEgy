import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable()
class OfferModel {
  String? id;
  String? image;

  OfferModel({
    this.id,
    this.image,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);
  Map<String, dynamic> toJson() => _$OfferModelToJson(this);
}