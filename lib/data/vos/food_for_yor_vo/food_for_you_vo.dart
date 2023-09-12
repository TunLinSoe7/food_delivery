import 'package:food_order_demo/constant/hive_constant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'food_for_you_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kFoodForYouHiveType)
class FoodForYouVO{
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;
  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;
  @JsonKey(name:'price')
  @HiveField(2)
  int? price;
  @JsonKey(name: 'image')
  @HiveField(3)
  String? image;
  FoodForYouVO({required this.id,required this.name,required this.price,required this.image});
  factory FoodForYouVO.fromJson(Map<String,dynamic> json)=>_$FoodForYouVOFromJson(json);
  Map<String,dynamic> toJson()=>_$FoodForYouVOToJson(this);
}