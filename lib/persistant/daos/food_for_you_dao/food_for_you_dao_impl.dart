import 'package:food_order_demo/constant/hive_constant.dart';
import 'package:food_order_demo/data/vos/food_for_yor_vo/food_for_you_vo.dart';
import 'package:hive/hive.dart';
import 'food_for_you_dao.dart';

class FoodForYouDAOImpl extends FoodForYouDAO{
  FoodForYouDAOImpl._();
  static final FoodForYouDAOImpl _singleton=FoodForYouDAOImpl._();
  factory FoodForYouDAOImpl()=>_singleton;

  @override
  List<FoodForYouVO>? getFoodForYouList() =>_foodBox().values.toList();

  @override
  Stream<List<FoodForYouVO>?> getFoodForYouListByStream() =>Stream.value(getFoodForYouList());
  @override
  void save(FoodForYouVO food) {
    if(food!=null){
      _foodBox().put(food.id, food);
    }
  }

  @override
  Stream watchBox() =>_foodBox().watch();
  Box<FoodForYouVO> _foodBox()=>Hive.box<FoodForYouVO>(kFoodForYouBoxName);
}