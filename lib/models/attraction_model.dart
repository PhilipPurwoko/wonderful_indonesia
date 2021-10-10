import 'package:json_annotation/json_annotation.dart';
part 'attraction_model.g.dart';

@JsonSerializable()
class AttractionModel {
  AttractionModel({
    required this.name,
    required this.address,
    required this.description,
    required this.imageUrl,
  });

  factory AttractionModel.fromJson(Map<String, dynamic> json) =>
      _$AttractionModelFromJson(json);
  Map<String, dynamic> toJson() => _$AttractionModelToJson(this);

  String name;
  String address;
  String description;
  String imageUrl;
}
