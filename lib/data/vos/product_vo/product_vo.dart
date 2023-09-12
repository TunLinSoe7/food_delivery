import 'package:json_annotation/json_annotation.dart';
part 'product_vo.g.dart';
@JsonSerializable()
class ProductVO{
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'image')
  String? image;
  ProductVO({required this.id,this.image});
  factory ProductVO.fromJson(Map<String,dynamic> json)=>_$ProductVOFromJson(json);
  Map<String,dynamic> toJson()=>_$ProductVOToJson(this);
}

