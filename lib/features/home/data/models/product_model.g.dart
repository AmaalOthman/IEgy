// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      colors:
          (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      image: json['image'] as String?,
      oldPrice: json['old_price'] as String?,
      price: json['price'] as String?,
      ratesCount: json['rates_count'] as String?,
      title: json['title'] as String?,
      titleEn: json['title_en'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'id': instance.id,
      'image': instance.image,
      'old_price': instance.oldPrice,
      'price': instance.price,
      'rates_count': instance.ratesCount,
      'title': instance.title,
      'title_en': instance.titleEn,
    };
