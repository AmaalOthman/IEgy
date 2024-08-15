import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  List<String>? colors;
  String? id;
  String? image;

  @JsonKey(name: 'old_price')
  String? oldPrice;

  String? price;

  @JsonKey(name: 'rates_count')
  String? ratesCount;

  String? title;

  @JsonKey(name: 'title_en')
  String? titleEn;

  ProductModel({
    this.colors,
    this.id,
    this.image,
    this.oldPrice,
    this.price,
    this.ratesCount,
    this.title,
    this.titleEn,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}