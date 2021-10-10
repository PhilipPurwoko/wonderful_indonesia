// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attraction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttractionModel _$AttractionModelFromJson(Map<String, dynamic> json) =>
    AttractionModel(
      name: json['name'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$AttractionModelToJson(AttractionModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
