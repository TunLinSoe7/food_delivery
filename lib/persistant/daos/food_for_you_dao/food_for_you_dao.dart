
import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';

abstract class FoodForYouDAO{
  void save(FoodForYouVO food);
  List<FoodForYouVO>? getFoodForYouList();
  Stream watchBox();
  Stream<List<FoodForYouVO>?> getFoodForYouListByStream();
}