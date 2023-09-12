import 'package:food_order_demo/constant/hive_constant.dart';
import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';
import 'package:hive/hive.dart';
part 'cart_vo.g.dart';
@HiveType(typeId: kCartHiveType)
class CartVO{
  @HiveField(0)
  FoodForYouVO foodForYouVO;
  @HiveField(1)
  int? quantity;
  CartVO({required this.foodForYouVO,this.quantity=1});
}