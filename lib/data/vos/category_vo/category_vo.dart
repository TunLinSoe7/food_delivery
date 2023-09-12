import 'package:json_annotation/json_annotation.dart';
part 'category_vo.g.dart';

@JsonSerializable()
class CategoryVO{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;
  CategoryVO({required this.id,required this.name,required this.image});
  factory CategoryVO.fromJson(Map<String,dynamic> json)=>_$CategoryVOFromJson(json);
  Map<String,dynamic> toJson()=>_$CategoryVOToJson(this);
}
